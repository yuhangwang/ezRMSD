## =====================================================
## Return an atom selection string for the common atoms
## between two atom selections
## =====================================================
## Args:
## =====================================================
## id1 (int): molecule ID for the first molecule
## seltxt1 (str): atom selection string for the first molecule
## id2 (int): molecule ID for the second molecule
## seltxt2 (str): atom selection string for the second molecule
## =====================================================
## Return (str): an atom selection string
## =====================================================
proc ::rmsd::common_seltxt {id1 seltxt1 id2 seltxt2} {
    set sel1 [atomselect $id1 "$seltxt1"]
    set sel2 [atomselect $id1 "$seltxt2"]

}