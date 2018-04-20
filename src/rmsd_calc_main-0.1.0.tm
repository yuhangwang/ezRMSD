#! package require rmsd_calc_all
#! package require rmsd_calc_res
#! package require rmsd_avg_by_chain
##=======================================================
## Calculate overall RMSD values
##=======================================================
## Args:
## -----
## id1 (int): molecule ID for the first molecule
## seltxt1 (str): atom selection string for the first molecule
## id2 (int): molecule ID for the second molecule
## seltxt2 (str): atom selection string for the second molecule
## rmsd_types (list): e.g. {overall res avg}
## do_align (bool): if true, alignment will be performed
##  before RMSD calculation
##=======================================================
## Returns (dict): a dict with rmsd_type as key and the
##  calculation results(dict) as the value.
##=======================================================
proc ::rmsd::calc::main {id1 seltxt1 id2 seltxt2 rmsd_types {do_align true}} {
    set output [::dict create]
    foreach rmsd_type $rmsd_types {
        if {$rmsd_type eq "all"} {
            ::dict set output $rmsd_type [::rmsd calc all $id1 $seltxt1 $id2 $seltxt2 $do_align]
        } elseif {$rmsd_type eq "res"} {
            ::dict set output $rmsd_type [::rmsd calc res $id1 $seltxt1 $id2 $seltxt2 $do_align]
        } elseif {$rmsd_type eq "avg"} {
            ::dict set output $rmsd_type [::rmsd::avg_by_chain \
                [::rmsd calc res $id1 $seltxt1 $id2 $seltxt2 $do_align]\ 
            ]
        } else {
            puts "WARNING: unrecognized RMSD type \"$rmsd_type\""
            continue
        }
    }
    return $output
}
