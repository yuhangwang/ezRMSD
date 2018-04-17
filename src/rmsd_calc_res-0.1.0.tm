##=======================================================
## Calculate per-residue RMSD values
##=======================================================
## Args:
## -----
## id1 (int): molecule ID for the first molecule
## seltxt1 (str): atom selection string for the first molecule
## id2 (int): molecule ID for the second molecule
## seltxt2 (str): atom selection string for the second molecule
## do_align = true (bool): (optional) if true, alignment will be done
## update_beta = true (bool): (optional) if true, beta field will be used
##      to store RMSD values. Residues not selected will have zero beta values.
##=======================================================
proc ::rmsd::calc::res {id1 seltxt1 id2 seltxt2 {do_align true} {update_beta true}} {
    set common [::rmsd::common_part $id1 $seltxt1 $id2 $seltxt2]
    set seltxt_common [::rmsd::seltxt $common]
    set ref    [::atomselect $id1 "$seltxt_common"]
    set target [::atomselect $id2 "$seltxt_common"]

    if {$do_align} {
        $target move [::measure fit $target $ref]
    }

    if {$update_beta} {
        foreach mol_id [::list $id1 $id2] {
            set sel [atomselect $mol_id all]
            $sel set beta 0.0
            $sel delete
        }
    }
    
    set output [::dict create]
    ::dict for {chain_id residue_dict} $common {
        if {[::dict size $residue_dict] > 0} {
            
            # accumuate all per-residue RMSD values for this chain
            set res_rmsd_dict {}
            ::dict for {resid_resname atom_name_list} $residue_dict {
                if {[::llength $atom_name_list] > 0} {
                    set sel_dict [::dict create \
                        $chain_id [::dict create $resid_resname $atom_name_list] \
                    ]
                    set res_seltxt [::rmsd::seltxt $sel_dict]
                    set res_ref    [::atomselect $id1 "$res_seltxt"]
                    set res_target [::atomselect $id2 "$res_seltxt"]
                    set rmsd_value [::measure rmsd $res_target $res_ref]
                    ::dict set res_rmsd_dict $resid_resname $rmsd_value
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

    $target delete
    $ref delete

    puts "=============================="
    puts "Atoms chosen:"
    puts "------------------------------"
    puts $seltxt_common
    puts ""

    return $output
}
