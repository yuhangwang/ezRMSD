## ========================================================
## Find the common residue IDs between two atom selections
## for every common chain.
## ========================================================
## Args:
## =====================================================
## id1 (int): molecule ID for the first molecule
## seltxt1 (str): atom selection string for the first molecule
## id2 (int): molecule ID for the second molecule
## seltxt2 (str): atom selection string for the second molecule
## chainIDs ([str]): a list of chain IDs
## ========================================================
## Returns (dict(str: [int])): a dict of residue IDs for each chain
## ========================================================
proc ::rmsd::common_residues {id1 seltxt1 id2 seltxt2 chainIDs} {
    set output {}
    foreach chainId $chainIDs {
        set sel1 [atomselect $id1 "($seltxt1) and chain $chainId"]
        set sel2 [atomselect $id2 "($seltxt2) and chain $chainId"]
        set IDs1 [lsort -unique [$sel1 get resid]]
        set IDs2 [lsort -unique [$sel2 get resid]]
        set commonIDs [::struct::set intersect $IDs1 $IDs2]
        lappend output $chainId 
        lappend output $commonIDs
        $sel1 delete
        $sel2 delete
    }
    return $output
 }
