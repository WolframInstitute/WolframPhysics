#!/usr/bin/env python3
"""Check that every web link the documentation sources carry resolves to a real page.

WHY THIS EXISTS. The root guide indexes functions that live outside this paclet: on the Wolfram
Function Repository, in other paclets, on GitHub, on wolframphysics.org and on Wolfram Community.
Each of those entries is a markdown hyperlink, and a hyperlink is a claim that a page exists at
that address. Nothing in the notebook build or the resource deploy verifies the claim: a link to
a Paclet Repository page for a paclet that was never published there converts, builds and
deploys exactly like a good one, and the reader lands on a sign-in page. So the links are
checked here, against the live sites, before a commit and in CI.

WHAT IS CHECKED. Every http(s) URL in a markdown link [text](url), an autolink <url> or a
frontmatter Links: entry, in docs/en/**/*.md and docs/ResourceDefinition.md. A URL is dead when

  - the request fails (DNS, connection, timeout after one retry), or
  - the final status is not 200 after redirects (a 429 is a throttle on this client, not a
    verdict on the page: GitHub answers a burst of /blob/ fetches with it, so a 429 is retried
    after a growing pause and counts as dead only when it persists), or
  - the redirects end on a sign-in page: the Wolfram resource sites answer a request for a
    resource that does not exist with a chain of redirects to account.wolfram.com rather than
    a 404, so a 200 there is the signature of a missing resource, not of a page.

A fragment (#section) is not verified; the page it is on is. Each distinct URL is fetched once,
however many pages carry it. Requests go out in parallel with a browser User-Agent (GitHub and
the Wolfram sites answer a bare python-urllib agent differently from a browser), HEAD first and
GET when a site refuses HEAD.

WHAT THIS CANNOT CONCLUDE. A page that exists can still be the wrong page (a function renamed,
a post edited); this checks that the address serves, not that it says what the entry claims.
Sites that require scripting to render still answer 200 to the fetch and pass.

Usage:  python3 tools/dev/doc_links_check.py [file.md ...]
        (no arguments: every source under docs/en and docs/ResourceDefinition.md)
Knobs:  WP_LINKS_JOBS=<n>     parallel requests (default 8)
        WP_LINKS_TIMEOUT=<s>  seconds per request (default 30)
        WP_SKIP_LINKS=1       do nothing and exit 0 (a machine without network; CI still runs it)
Exit:   0 every link resolves, 1 otherwise (each dead link printed as file:line: url: reason),
        2 on a usage error.
"""

import os
import re
import sys
import time
import urllib.error
import urllib.request
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SOURCES = [ROOT / "docs" / "en", ROOT / "docs" / "ResourceDefinition.md"]

USER_AGENT = (
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 "
    "(KHTML, like Gecko) Chrome/124.0 Safari/537.36 WolframPhysics-doc-links-check"
)
# a redirect chain that ends on one of these hosts is a sign-in page, whatever its status
SIGN_IN_HOSTS = ("account.wolfram.com", "user.wolfram.com")
# attempts allowed for a url the site is throttling (429), each after a longer pause: the
# pause starts at THROTTLE_PAUSE seconds and doubles, so the last attempt comes after more
# than a minute, which outlasts GitHub's window
THROTTLE_ATTEMPTS = 5
THROTTLE_PAUSE = 5.0

LINK_RE = re.compile(r"\]\((https?://[^)\s]+)\)")
AUTOLINK_RE = re.compile(r"<(https?://[^>\s]+)>")
FRONTMATTER_LINK_RE = re.compile(r"\((https?://[^)\s\"]+)\)")


def source_files(args):
    if args:
        files = [Path(a) for a in args]
        missing = [str(f) for f in files if not f.is_file()]
        if missing:
            print("doc_links_check: no such file: " + ", ".join(missing), file=sys.stderr)
            sys.exit(2)
        return files
    files = []
    for source in SOURCES:
        if source.is_file():
            files.append(source)
        elif source.is_dir():
            for dirpath, dirnames, filenames in os.walk(source):
                dirnames[:] = [d for d in dirnames if not d.startswith(".")]
                files.extend(Path(dirpath) / f for f in sorted(filenames) if f.endswith(".md"))
    return files


def links_in(file):
    """(line number, url) for every web link in the file, fenced code blocks excluded."""
    found = []
    in_fence = False
    with open(file, encoding="utf-8") as handle:
        for number, line in enumerate(handle, 1):
            if line.startswith("```"):
                in_fence = not in_fence
                continue
            if in_fence:
                continue
            urls = []
            for pattern in (LINK_RE, AUTOLINK_RE, FRONTMATTER_LINK_RE):
                urls.extend(url.rstrip(".,;") for url in pattern.findall(line))
            # the patterns overlap on a markdown link, so a line reports each url once
            found.extend((number, url) for url in dict.fromkeys(urls))
    return found


def fetch(url, timeout):
    """None when the url serves a page, else the reason it does not."""
    target = url.split("#", 1)[0]
    last = ""
    attempts = 2  # a 5xx or a connection failure is retried once
    pause = 2.0
    attempt = 0
    while True:
        attempt += 1
        for method in ("HEAD", "GET"):
            request = urllib.request.Request(target, method=method, headers={"User-Agent": USER_AGENT})
            try:
                with urllib.request.urlopen(request, timeout=timeout) as response:
                    final = response.geturl()
                    host = urllib.request.urlparse(final).netloc
                    if any(host == h or host.endswith("." + h) for h in SIGN_IN_HOSTS):
                        return "redirects to a sign-in page (" + final + "): no such resource"
                    if response.status != 200:
                        return "status %d" % response.status
                    return None
            except urllib.error.HTTPError as error:
                last = "status %d" % error.code
                # a site that refuses HEAD answers 403 or 405; GET decides
                if method == "HEAD" and error.code in (403, 405, 400, 501):
                    continue
                if error.code == 429:
                    # Too Many Requests throttles this client and says nothing about the
                    # page: wait out the Retry-After when the site names one, else a pause
                    # that doubles each time, and ask again
                    attempts = THROTTLE_ATTEMPTS
                    pause = max(pause, THROTTLE_PAUSE)
                    header = error.headers.get("Retry-After") if error.headers else None
                    if header and header.strip().isdigit():
                        pause = max(pause, min(float(header), 60.0))
                    break
                if 500 <= error.code < 600 and attempt == 1:
                    break  # retry the whole pair once
                return last
            except Exception as error:  # DNS, connection, timeout
                last = type(error).__name__ + ": " + str(error).splitlines()[0] if str(error) else type(error).__name__
                if method == "HEAD":
                    continue
                break
        if attempt >= attempts:
            return last or "no response"
        time.sleep(pause)
        pause = min(pause * 2, 60.0)


def main(args):
    if os.environ.get("WP_SKIP_LINKS") == "1":
        print("doc_links_check: WP_SKIP_LINKS=1, links not checked here (CI checks them)")
        return 0
    jobs = int(os.environ.get("WP_LINKS_JOBS", "8"))
    timeout = float(os.environ.get("WP_LINKS_TIMEOUT", "30"))
    files = source_files(args)
    occurrences = []  # (file, line, url)
    for file in files:
        for number, url in links_in(file):
            occurrences.append((file, number, url))
    urls = sorted({url.split("#", 1)[0] for _, _, url in occurrences})
    if not urls:
        print("doc_links_check: no web link in %d source file(s)" % len(files))
        return 0
    with ThreadPoolExecutor(max_workers=jobs) as pool:
        verdicts = dict(zip(urls, pool.map(lambda u: fetch(u, timeout), urls)))
    dead = 0
    for file, number, url in occurrences:
        reason = verdicts[url.split("#", 1)[0]]
        if reason is not None:
            dead += 1
            try:
                shown = file.resolve().relative_to(ROOT)
            except ValueError:
                shown = file
            print("%s:%d: %s: %s" % (shown, number, url, reason))
    print("doc_links_check: %d dead link(s) among %d distinct url(s) in %d source file(s)"
          % (dead, len(urls), len(files)))
    return 1 if dead else 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
