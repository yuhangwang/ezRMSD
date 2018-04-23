## Align structures
namespace eval ::rmsd {
    namespace export align
    namespace export calc
    namespace export run
    namespace ensemble create
    namespace eval calc {
        namespace export all
        namespace export res
        namespace ensemble create
    }

    namespace eval data {
    }
    
    namespace eval io {
        namespace eval read {
            namespace export cfg
            namespace ensemble create
        }
        namespace eval write {
        }
        namespace export read
        namespace ensemble create
    }
}

package require math_avg
package require fmap
package require fold
package require filter
package require nonblank
package require vmd_io_load
package require io_save_list
package require io_read_lines
package require io_read_all
package require struct_set_intersect
package require rmsd_common_chains
package require rmsd_common_residues
package require rmsd_common_atoms
package require rmsd_common_part
package require rmsd_seltxt
package require rmsd_align
package require rmsd_calc_all
package require rmsd_calc_res
package require rmsd_calc_main
package require rmsd_data_collapse
package require rmsd_io_read_cfg
package require rmsd_io_write_data
package require rmsd_io_write_pdb
package require rmsd_io_write_main
package require rmsd_collect_res_keys
package require rmsd_shared_res_keys
package require rmsd_avg_by_chain

package require rmsd_main
package require rmsd_run
