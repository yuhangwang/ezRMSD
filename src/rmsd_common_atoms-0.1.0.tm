## ========================================================
## Find the common atoms between two atom selections
## for every common chain.
## ========================================================
## Args:
## =====================================================
## id1 (int): molecule ID for the first molecule
## seltxt1 (str): atom selection string for the first molecule
## id2 (int): molecule ID for the second molecule
## seltxt2 (str): atom selection string for the second molecule
## dict_chain_residue ({str: [int]}): a dictionary of chain ID => residue IDs
## ========================================================
## Returns: a dictionary of chainID:(residue_ID, residue_name):[atom_names]
## ========================================================
proc ::rmsd::common_atoms {id1 seltxt1 id2 seltxt2 dict_chain_residue} {
    set output [dict create]

    dict for {chainId resIdList} $dict_chain_residue {
        set dict_resId_resName [dict create]
        foreach resId $resIdList {
            set sel1 [atomselect $id1 "($seltxt1) and chain $chainId and resid $resId"]
            set sel2 [atomselect $id2 "($seltxt2) and chain $chainId and resid $resId"]
            set names1 [$sel1 get name]
            set names2 [$sel2 get name]
            set resname1 [::lindex [$sel1 get resname] 0]
            set resname2 [::lindex [$sel2 get resname] 0]
            if {$resname1 == $resname2} {
                set common_names [::struct::set intersect $names1 $names2]
                dict set dict_resId_resName [::list $resId $resname1] $common_names 
            } else {
                puts ">>> WARNING: two corresponding residues should have the same residue type"
                puts ">>> reference: \"$chainId:$resId is $resname1\""
                puts ">>> target:    \"$chainId:$resId is $resname2\""
            }
        }
        dict set output $chainId $dict_resId_resName
    }
    return $output
 }
