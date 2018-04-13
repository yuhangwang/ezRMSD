
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
    set seltxt_common [::rmsd::common_seltxt $id1 $seltxt1 $id2 $seltxt2]
    set ref    [::atomselect $id1 "$seltxt_common"]
    set target [::atomselect $id2 "$seltxt_common"]
    $target move [::measure fit $target $ref]
    $target delete
    $ref delete
}
