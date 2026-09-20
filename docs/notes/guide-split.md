# Notes on the guide split

## URL substitutions made during the split

Nineteen entries carried over from the single root guide kept their name but were relinked to
the file that actually defines the symbol. A strict name-plus-URL comparison against the old
guide reports these as losses; they are not. Each replacement URL was fetched and confirmed,
and each is recorded in the normalized inventory rows under
`scratchpad/inventory/merged.json`.

### WolframInstitute/InfraCausality

The old guide linked these to `InfraCausality/Kernel/InfraCausality.wl`, which holds only the
export declaration. They are now linked to the kernel file that defines each one.

Moved to `InfraCausality/Kernel/RelativisticDynamics.wl`:
`ChainLightReach`, `ChainProjection`, `InfraEnergy`, `InfraInterval`, `InfraKinematics`,
`InfraMass`, `InfraMomentum`, `InfraVelocity`.

Moved to `InfraCausality/Kernel/EPSAxiomatics.wl`:
`EchoGraph`, `FindEchoFunction`, `FindMessageFunction`, `MonotoneQ`, `MultiEchoFunction`,
`MultiMessageFunction`.

### WolframInstitute/Infrageometry

Five hypergraph structure symbols moved from the repository root
`https://github.com/WolframInstitute/Infrageometry` to
`https://github.com/WolframInstitute/Infrageometry/blob/main/Infrageometry/Kernel/Hypergraph.wl`,
which is where they are defined. They appear on
`docs/en/Guides/HypergraphRewriting/Hypergraphs.md` under `### WolframInstitute/Infrageometry`.

## Sources considered and dropped

- `WolframInstitute/PersistenceRewriting`. The inventory files nineteen rows for it, two of them
  core (`EmeLifetimes`, `LifetimesBarcode`). Both the repository page
  `https://github.com/WolframInstitute/PersistenceRewriting` and the kernel file the rows cite
  answer 404, so the repository is not publicly readable and no entry can carry a link a reader
  could follow. The source is left off the tree until it is published.
