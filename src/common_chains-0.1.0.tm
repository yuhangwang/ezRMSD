## ========================================================
## Find the common chain IDs between two atom selections
## ========================================================
## Args:
## =====================================================
## id1 (int): molecule ID for the first molecule
## seltxt1 (str): atom selection string for the first molecule
## id2 (int): molecule ID for the second molecule
## seltxt2 (str): atom selection string for the second molecule
## ========================================================
## Returns (str): an atom selection string for chain IDs
##  e.g. "chain A B D"
## ========================================================
proc ::ezRMSD::common_chains {id1 seltxt1 id2 seltxt2} {
    set sel1 [atomselect $id1 "$seltxt1"]
    set sel2 [atomselect $id1 "$seltxt2"]
    set chainIDs1 [$sel1 get chain]
    set chainIDs2 [$sel2 get chain]
    
}