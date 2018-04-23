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
## Returns ({dict, dict}): two dictionaries
## 1. a dict with rmsd_type as key and the
##  calculation results(dict) as the value.
## 2. the atom selection used for RMSD calculation
##=======================================================
proc ::rmsd::calc::main {id1 seltxt1 id2 seltxt2 rmsd_types {do_align true}} {
    set common [::rmsd::common_part $id1 $seltxt1 $id2 $seltxt2]
    set seltxt [::rmsd::seltxt $common]
    set ref    [::atomselect $id1 $seltxt]
    set target [::atomselect $id2 $seltxt]

    set output [::dict create]
    foreach rmsd_type $rmsd_types {
        if {$rmsd_type eq "overall"} {
            ::dict set output $rmsd_type [::rmsd calc all $ref $target $common $do_align]
        } elseif {$rmsd_type eq "res"} {
            ::dict set output $rmsd_type [::rmsd calc res $ref $target $common $do_align]
        } elseif {$rmsd_type eq "avg"} {
            ::dict set output $rmsd_type [::rmsd::avg_by_chain \
                [::rmsd calc res $ref $target $common $do_align]\ 
            ]
        } else {
            puts "=================================================="
            puts "(::rmsd::calc::main)"
            puts "WARNING: unsupported RMSD type \"$rmsd_type\""
            puts "=================================================="
            continue
        }
    }
    return [list $output $common]
}
