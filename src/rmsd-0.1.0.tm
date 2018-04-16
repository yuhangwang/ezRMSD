## Align structures
namespace eval ::rmsd {
    namespace export align
    namespace export calc
    namespace eval calc {
        namespace export all
        namespace ensemble create
    }
    namespace ensemble create
}

package require set_intersect
package require common_chains
package require common_residues
package require common_atoms
package require common_part
package require rmsd_seltxt
package require rmsd_align
package require rmsd_calc_all