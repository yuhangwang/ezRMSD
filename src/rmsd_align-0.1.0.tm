
## ===============================================================
## Align two molecules with different number of residues
## ===============================================================
## Args:
## -----
## id1 (int): molecule ID for the first molecule
## seltxt1 (str): atom selection string for the first molecule
## id2 (int): molecule ID for the second molecule
## seltxt2 (str): atom selection string for the second molecule
## ===============================================================
proc ::rmsd::align {id1 seltxt1 id2 seltxt2} {
    set common [::rmsd::common_part \
        $id1 $seltxt1 \
        $id2 $seltxt2 \
    ] 
    set seltxt_common [::rmsd::seltxt $common]

    set ref    [::atomselect $id1 "$seltxt_common"]
    set target [::atomselect $id2 "$seltxt_common"]
    set target_all [::atomselect $id2 all]
    $target_all move [::measure fit $target $ref]
    $target_all delete
    $target delete
    $ref delete
    return $common
}
