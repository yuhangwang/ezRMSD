namespace eval ::rmsd {}
package require set_intersect
package require common_chains
package require common_residues
package require common_atoms
package require rmsd_seltxt
package require rmsd_align

## Align structures
namespace eval ::rmsd {
    namespace export align
    namespace export calc
    namespace ensemble create
}
