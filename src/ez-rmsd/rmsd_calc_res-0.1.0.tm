##=======================================================
## Calculate per-residue RMSD values
##=======================================================
## Args:
## -----
## ref (object): VMD atom selection object for the reference
## target (object):: VMD atom selection object for the target
## common (dict): common chains and residues
## do_align = true (bool): (optional) if true, alignment will be done
## update_beta = true (bool): (optional) if true, beta field will be used
##      to store RMSD values. Residues not selected will have zero beta values.
##=======================================================
proc ::rmsd::calc::res {ref target seltxt1 seltxt2 common {do_align true} {update_beta true}} {
    set id1 [$ref    molid]
    set id2 [$target molid]

    if {$do_align} {
        set target_all [::atomselect $id2 all]
        $target_all move [::measure fit $target $ref]
        $target_all delete
    }

    if {$update_beta} {
        foreach mol_id [::list $id1 $id2] {
            set sel [atomselect $mol_id all]
            $sel set beta 0.0
            $sel delete
        }
    }
    
    set output [::dict create]
    foreach chain_id [::dict keys $common] {
        set residue_dict [::dict get $common $chain_id]
        if {[::dict size $residue_dict] > 0} {
            # accumuate all per-residue RMSD values for this chain
            set res_rmsd_dict {}
            foreach res_key [::dict keys $residue_dict] {
                set atom_name_list [::dict get $residue_dict $res_key]
                if {[::llength $atom_name_list] > 0} {
                    set sel_dict [::dict create \
                        $chain_id [::dict create $res_key $atom_name_list] \
                    ]
                    set res_seltxt [::rmsd::seltxt $sel_dict]
                    # note: must intersect with $seltxt1 or $seltxt2 to avoid 
                    # problems with alternative conformations (e.g. "altloc A B")
                    # Steven Yuhang Wang 8/14/2018
                    set res_ref    [::atomselect $id1 "($seltxt1) and ($res_seltxt)"]
                    set res_target [::atomselect $id2 "($seltxt2) and ($res_seltxt)"]
                    set rmsd_value [format "%.3f" [::measure rmsd $res_target $res_ref]]
                    ::dict set res_rmsd_dict $res_key $rmsd_value
                    if {$update_beta} {
                        $res_ref    set beta $rmsd_value
                        $res_target set beta $rmsd_value
                    }
                    $res_ref    delete
                    $res_target delete
                } else {}
            }

            if {[::dict size $res_rmsd_dict] > 0} {
                ::dict set output $chain_id  $res_rmsd_dict
            } else {}

        } else {}
    }

    return $output
}
