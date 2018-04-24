##=======================================================
## Calculate overall RMSD values
##=======================================================
## Args:
## -----
## ref (object): VMD atom selection object for the reference
## target (object):: VMD atom selection object for the target
## common (dict): common chains and residues
## do_align = true (bool): (optional) if true, alignment will be done
##=======================================================
proc ::rmsd::calc::all {ref target common {do_align true}} {
    if {$do_align} {
        set target_all [::atomselect [$target molid] all]
        $target_all move [::measure fit $target $ref]
        $target_all delete
    }

    return [::dict create \
        "_" [::dict create \
                "_" [format "%.3f" [::measure rmsd $target $ref]] \
            ] \
    ]
}
