/* Loader of the single-page documentation browser. scripts/build_site.wls fills the five slots
   (BASE, DOCS, HOME, PAGE, ROOT) and inlines this into index.html, so nothing else here may
   carry a backtick: they delimit StringTemplate slots.

   BASE  where the documentation pages live: the deployed cloud resource (target "site") or "."
         beside index.html (target "local").
   DOCS  what sits between BASE and the page id: the cloud resource keeps its pages under
         /Documentation/, a local build keeps them at the root of the site.
   HOME  what the frame shows when no page is selected: the resource landing page in the cloud,
         the root guide on a local build.
   PAGE  the notebook host page, site target only. Empty locally, where the rendered files are
         framed directly.
   ROOT  the name of the root guide, used to warm the cloud notebook renderer.

   The tree, the hash in the address bar and the frame stay in step: a click loads a page and
   pushes its id, the back button loads what the id names, and a link inside the framed page to
   another page of this tree is caught and routed the same way instead of navigating the frame on
   its own. The frame itself never adds to the history: it is navigated by replacing its location,
   so one press of the back button is one step. */
(function () {
  var BASE = '`BASE`', DOCS = '`DOCS`', HOME = '`HOME`', PAGE = '`PAGE`', ROOT = '`ROOT`', cur = null;
  var frame = document.getElementById('frame'),
      loading = document.getElementById('loading'),
      note = document.getElementById('note'),
      side = document.getElementById('side'),
      resLink = document.getElementById('resourcelink');

  /* An id is 'guide/X', 'ref/Y' or 'tutorial/Z': the last two segments of a documentation URI.
     LINK_RE only recognises the shape; whether a link is one of this tree's pages is decided by
     the tree itself (findLink), since http://reference.wolfram.com/language/ref/Dataset.html has
     the same tail and must be left alone. */
  var ID_RE = /^(guide|ref|tutorial)\/[A-Za-z0-9]+$/,
      LINK_RE = /\/(guide|ref|tutorial)\/([A-Za-z0-9]+)\.(?:html|nb)(?:[?#].*)?$/;

  function pageURL(id) { return BASE + DOCS + id + '.html'; }
  /* the header button opens the page as it stands on its own, outside this shell; with no page
     selected it points at the resource itself */
  function setTwin(id) {
    if (resLink) { resLink.href = id ? pageURL(id) : (BASE + '/'); }
  }

  /* The framed page is a whole documentation page: its own sticky header, its empty menu column
     and its footer are chrome this shell already provides, and the cloud embed pages add the
     resource shingle's header and sidebar on top. Hide all of it from inside (same origin) so
     only the content of the page shows. */
  var HIDE = [
    'header.stickyheader,#pg-header,#pac-nav-sidebar,#pac-nav-sidebar-frame,',
    '.page-sidebar,.page-sidebar-frame,.page-sidebar-toggle,#pageSidebar,#pageSidebarFrame,',
    '.menu-container,#_footer,#_footer-offset{display:none!important}',
    /* the page stylesheet reserves a 100px band above the page for the wolfram.com global
       header, as a border on the root element; with the header hidden only the band is left */
    'html{border-top:0!important}',
    '.shingle-content,main.shingle-content{margin-left:0!important;max-width:none!important;width:auto!important}',
    /* the embed page caps its column at 830px; here the page already sits beside the rail, so
       that cap only wastes the width */
    '.wrap{max-width:none!important;padding:0 24px!important;margin:0!important}',
    /* every input cell is followed by a caption carrying its code as text, for a screen reader;
       the shipped stylesheets never define the class, so without this rule the caption shows as
       a second copy of every input */
    '.screen-reader-only{position:absolute!important;width:1px;height:1px;margin:-1px;padding:0;',
    'overflow:hidden;clip:rect(0 0 0 0);white-space:nowrap;border:0}',
    /* the Details and Options toggle and the Show More control are drawn with icons the shipped
       asset bundle does not contain, so on a symbol page they show as broken images; the text
       label beside them is the same control */
    'img[src*="/img/DetailsOptions-"],img[src*="/img/Options-hamburger-"]{display:none!important}',
    /* the paclet home page alone carries these: an Examples wrapper the deploy fabricates around
       empty subsections, and a Paclet Source link useful only to the paclet author */
    'div[data-target="#nbCollapseExampleNotebook"],#nbCollapseExampleNotebook,',
    '#Paclet-Source,#Paclet-Source+ul{display:none!important}'
  ].join('');

  function injectHide() {
    try {
      var d = frame.contentDocument;
      if (!d || !d.head || d.getElementById('wp-hide-chrome')) { return; }
      var s = d.createElement('style');
      s.id = 'wp-hide-chrome';
      s.textContent = HIDE;
      d.head.appendChild(s);
    } catch (e) {}
  }

  /* the origin a link resolves to, or '' when it does not resolve at all */
  function originOf(a) {
    try { return new URL(a.href, location.href).origin; } catch (e) { return ''; }
  }

  /* Route the links inside the framed page through the loader, so navigation stays in the shell
     rather than replacing the frame with a page that has lost its tree. Only a link to a page of
     this tree, on this origin, is taken over; a link to another site keeps its own navigation and
     opens in a new tab, so a reference to Wolfram's own documentation leaves the frame instead
     of being rewritten into a page this site does not have. */
  function hookFrame() {
    try {
      var d = frame.contentDocument;
      if (!d) { return; }
      var as = d.querySelectorAll('a[href]'), i;
      for (i = 0; i < as.length; i++) {
        (function (a) {
          if (a.__wp) { return; }
          a.__wp = 1;
          var m = (a.getAttribute('href') || '').match(LINK_RE),
              id = m ? (m[1] + '/' + m[2]) : '',
              origin = originOf(a);
          if (id && findLink(id) && origin === location.origin) {
            a.addEventListener('click', function (e) {
              e.preventDefault();
              load(id, true);
            });
          } else if (/^https?:$/.test(a.protocol) && origin !== location.origin) {
            a.target = '_blank';
            a.rel = 'noopener';
          }
        })(as[i]);
      }
    } catch (e) {}
  }

  /* ---- the tree ------------------------------------------------------------------------- */
  function openAnc(a) {
    var n = a.parentNode;
    while (n && n !== side) {
      if (n.tagName === 'DETAILS') { n.open = true; }
      n = n.parentNode;
    }
  }
  function setActive(a) {
    if (cur) { cur.classList.remove('active'); }
    cur = a;
    if (a) {
      a.classList.add('active');
      openAnc(a);
      a.scrollIntoView({ block: 'nearest' });
    }
  }
  /* every page is in the tree once, so its id identifies exactly one link */
  function findLink(id) { return side.querySelector('a[data-id="' + id + '"]'); }

  /* ---- loading a page ------------------------------------------------------------------- */
  /* On the site target the page loads through PAGE, a standalone document that injects the
     cloud's own static pre-render into the container it then hands the notebook embedder: the
     embedder wants a window-scrolled document, and hydrating the pre-render in place is what
     makes the swap invisible. With PAGE empty the built file is framed directly. */
  function frameURL(id) { return PAGE ? (PAGE + '?p=' + encodeURIComponent(id)) : pageURL(id); }

  /* Navigating the frame by assigning its src adds an entry to the session history, on top of
     the one the shell pushes for the hash, and the back button then takes two presses per step
     and moves the frame out of step with the tree. Replacing the frame's location navigates it
     without a history entry; assigning src remains the fallback for a frame with no window yet.
     frameHref is what the frame was last sent to (frame.src stays at its initial value). */
  var frameHref = frame.getAttribute('src') || '';
  function navigate(url) {
    frameHref = url;
    loading.classList.add('on');
    try {
      if (frame.contentWindow) { frame.contentWindow.location.replace(url); return; }
    } catch (e) {}
    frame.src = url;
  }
  function showNote(text) {
    if (!note) { return; }
    note.textContent = text;
    note.classList.add('on');
  }
  function clearNote() { if (note) { note.classList.remove('on'); } }

  /* false for anything that is not a page of this tree, so a stale bookmark or a mistyped hash
     is never framed blind as a server error page */
  function load(id, push, el) {
    if (!ID_RE.test(id)) { return false; }
    var link = el || findLink(id);
    if (!link) { return false; }
    clearNote();
    navigate(frameURL(id));
    setActive(link);
    setTwin(id);
    if (push && location.hash !== '#' + id) { history.pushState(null, '', '#' + id); }
    return true;
  }
  function goHome(push) {
    clearNote();
    navigate(HOME);
    setActive(null);
    setTwin(null);
    if (push && location.hash !== '') { history.pushState(null, '', '#'); }
  }
  /* what the address bar names, or home with a note when it names no page of this tree */
  function loadHash(push) {
    var id = location.hash.slice(1);
    if (id && load(id, push)) { return; }
    goHome(push);
    if (id) { showNote('There is no page "' + id + '" in this documentation; showing the guide instead.'); }
  }

  /* the host page hands a link click up rather than reloading itself blind; only the framed
     document, on this origin, may drive the navigation */
  window.addEventListener('message', function (e) {
    if (e.source !== frame.contentWindow || e.origin !== location.origin) { return; }
    if (e.data && typeof e.data.wpNav === 'string') { load(e.data.wpNav, true); }
  });

  frame.addEventListener('load', function () {
    loading.classList.remove('on');
    /* the host page hides its own chrome and hands its links up; every other framed document
       needs both done from here, and the cloud pages finish assembling themselves after load,
       so repeat it for a few seconds */
    if (PAGE && frameHref.indexOf(PAGE) === 0) { return; }
    injectHide();
    hookFrame();
    var n = 0, t = setInterval(function () {
      injectHide();
      hookFrame();
      if (++n > 10) { clearInterval(t); }
    }, 400);
  });

  /* ---- filter ----------------------------------------------------------------------------
     Hide the entries that do not match, in place, keeping the whole ancestor chain of a match
     visible so its group survives and opens. Clearing the box restores the tree as it was. */
  var qBox = document.getElementById('q'), openState = null;

  function emptyNote(on) {
    var empty = side.querySelector('.nav-empty');
    if (on && !empty) {
      empty = document.createElement('div');
      empty.className = 'nav-empty';
      empty.textContent = 'no matches';
      side.appendChild(empty);
    } else if (!on && empty) {
      empty.parentNode.removeChild(empty);
    }
  }

  function runFilter() {
    var term = (qBox.value || '').trim().toLowerCase(),
        lis = side.querySelectorAll('li'),
        as = side.querySelectorAll('a[data-id]'),
        ds = side.querySelectorAll('details'),
        i, n, a;
    if (term && !openState) {            /* remember the shape before the first filter */
      openState = new Map();
      for (i = 0; i < ds.length; i++) { openState.set(ds[i], ds[i].open); }
    }
    for (i = 0; i < lis.length; i++) { lis[i].__hit = false; }
    for (i = 0; i < as.length; i++) {
      a = as[i];
      /* the title and the page's own frontmatter keywords, so "branchial" finds the pages
         about it whether or not their titles say the word */
      if (term && (a.textContent + ' ' + (a.getAttribute('data-kw') || '')).toLowerCase().indexOf(term) === -1) {
        continue;
      }
      n = a.closest('li');
      while (n && side.contains(n)) {
        n.__hit = true;
        n = n.parentElement && n.parentElement.closest('li');
      }
    }
    for (i = 0; i < lis.length; i++) { lis[i].style.display = lis[i].__hit ? '' : 'none'; }
    for (i = 0; i < ds.length; i++) {
      if (!term) { ds[i].open = !!(openState && openState.get(ds[i])); }
      else if (ds[i].closest('li').__hit) { ds[i].open = true; }
    }
    emptyNote(!!term && side.querySelectorAll('li[style*="none"]').length === lis.length);
    if (!term) { openState = null; }
  }

  if (qBox) {
    qBox.addEventListener('input', runFilter);
    qBox.addEventListener('keydown', function (e) {
      if (e.key === 'Escape') { qBox.value = ''; runFilter(); qBox.blur(); }
    });
    document.addEventListener('keydown', function (e) {
      if (e.key === '/' && document.activeElement !== qBox) { e.preventDefault(); qBox.focus(); }
    });
  }

  /* ---- the drawer, on a narrow screen ------------------------------------------------------
     The toggle is inert on a wide screen, where the button is display:none. Choosing a page
     closes the drawer, which is what a reader expects after tapping a link. */
  var scrim = document.getElementById('scrim'), navToggle = document.getElementById('navToggle');
  function closeDrawer() {
    side.classList.remove('open');
    if (scrim) { scrim.classList.remove('on'); }
  }
  if (navToggle) {
    navToggle.addEventListener('click', function () {
      if (side.classList.contains('open')) { closeDrawer(); return; }
      side.classList.add('open');
      if (scrim) { scrim.classList.add('on'); }
    });
  }
  if (scrim) { scrim.addEventListener('click', closeDrawer); }
  document.addEventListener('keydown', function (e) { if (e.key === 'Escape') { closeDrawer(); } });

  /* ---- the rail splitter -------------------------------------------------------------------
     Drag the divider to rebalance the columns, double-click to restore the default; the width
     persists per browser. The pointer is captured on the splitter and the iframe is made inert
     for the drag, or the pointer crosses into the framed document and the drag stops dead. */
  var main = document.getElementById('main'), DEFAULT_WIDTH = 320;
  function railWidth(px) {
    var max = Math.max(220, window.innerWidth * 0.45);
    side.style.width = Math.round(Math.min(max, Math.max(220, px))) + 'px';
  }
  function storeWidth() {
    try { localStorage.setItem('wp-docs-rail', String(parseInt(side.style.width, 10) || DEFAULT_WIDTH)); } catch (e) {}
  }
  (function restoreWidth() {
    try {
      var w = parseInt(localStorage.getItem('wp-docs-rail') || '', 10);
      if (w) { railWidth(w); }
    } catch (e) {}
  })();
  (function dragSplitter(handle) {
    if (!handle) { return; }
    handle.addEventListener('pointerdown', function (e) {
      e.preventDefault();
      handle.setPointerCapture(e.pointerId);
      handle.classList.add('dragging');
      if (main) { main.classList.add('resizing'); }
      var startX = e.clientX, startW = side.getBoundingClientRect().width;
      function move(ev) { railWidth(startW + ev.clientX - startX); }
      function up(ev) {
        handle.releasePointerCapture(ev.pointerId);
        handle.classList.remove('dragging');
        if (main) { main.classList.remove('resizing'); }
        handle.removeEventListener('pointermove', move);
        handle.removeEventListener('pointerup', up);
        storeWidth();
      }
      handle.addEventListener('pointermove', move);
      handle.addEventListener('pointerup', up);
    });
    handle.addEventListener('dblclick', function () { railWidth(DEFAULT_WIDTH); storeWidth(); });
    /* the splitter is focusable, so the arrow keys should move it too */
    handle.addEventListener('keydown', function (e) {
      var step = e.shiftKey ? 40 : 12, w = side.getBoundingClientRect().width;
      if (e.key === 'ArrowLeft') { railWidth(w - step); }
      else if (e.key === 'ArrowRight') { railWidth(w + step); }
      else { return; }
      e.preventDefault();
      storeWidth();
    });
  })(document.getElementById('splitL'));

  /* ---- routing ---------------------------------------------------------------------------
     A tree link carries the page's real URL in href, so it works with scripting off and a
     middle click opens the page on its own; a plain click stays in the shell. */
  side.addEventListener('click', function (e) {
    var a = e.target.closest && e.target.closest('a[data-id]');
    if (!a) { return; }
    e.preventDefault();
    load(a.getAttribute('data-id'), true, a);
    closeDrawer();
  });
  var brand = document.getElementById('homelink');
  if (brand) { brand.addEventListener('click', function (e) { e.preventDefault(); goHome(true); }); }
  window.addEventListener('popstate', function () { loadHash(false); });
  loadHash(false);

  /* The cloud embed pages pull a notebook renderer bundle of about half a megabyte, cacheable
     for a year. Ask the cloud which scripts that is and prefetch them, so the first page click
     does not pay for it. Local builds have no such bundle, and BASE tells the two apart. */
  (function preloadEmbedder() {
    try {
      var i = BASE.indexOf('/obj/');
      if (i < 0) { return; }
      var origin = BASE.slice(0, i),
          path = BASE.slice(i + 5) + DOCS + 'guide/' + ROOT + '.nb',
          x = new XMLHttpRequest();
      x.open('GET', origin + '/notebooks/embedding?path=' + encodeURIComponent(path), true);
      x.onload = function () {
        if (x.status !== 200) { return; }
        try {
          var d = JSON.parse(x.responseText);
          [d.mainScript].concat(d.otherScripts || []).forEach(function (sc) {
            var l = document.createElement('link');
            l.rel = 'prefetch';
            l.href = origin + sc;
            document.head.appendChild(l);
          });
        } catch (e) {}
      };
      x.send();
    } catch (e) {}
  })();
})();
