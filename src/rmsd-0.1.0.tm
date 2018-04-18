## Align structures
namespace eval ::rmsd {
    namespace export align
    namespace export calc
    namespace export run
    namespace eval calc {
        namespace export all
        namespace export res
        namespace ensemble create
    }
    namespace eval io {
        namespace eval read {
            namespace export cfg
            namespace ensemble create
        }
        namespace export read
        namespace ensemble create
    }
    namespace ensemble create
}

package require fmap
package require filter
package require nonblank
package require vmd_io_load
package require io_save_list
package require io_read_lines
package require set_intersect
package require common_chains
package require common_residues
package require common_atoms
package require common_part
package require rmsd_seltxt
package require rmsd_align
package require rmsd_calc_all
package require rmsd_calc_res
package require rmsd_d2l_all
package require rmsd_d2l_chain
package require rmsd_io_read_cfg
