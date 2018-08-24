## ========================================================
## Find the common part between two atom selections
## ========================================================
## Args:
## =====================================================
## id1 (int): molecule ID for the first molecule
## seltxt1 (str): atom selection string for the first molecule
## id2 (int): molecule ID for the second molecule
## seltxt2 (str): atom selection string for the second molecule
## ========================================================
## Returns (dict(str: [int])): a dict of residue IDs for each chain
## ========================================================
proc ::rmsd::common_part {id1 seltxt1 id2 seltxt2} {
    return [::rmsd::common_atoms \
        $id1 $seltxt1 \
        $id2 $seltxt2 \
        [::rmsd::common_residues \
            $id1 $seltxt1 \
            $id2 $seltxt2 \
            [::rmsd::common_chains \
                $id1 $seltxt1 \
                $id2 $seltxt2 \
            ]\
        ]\
    ]
 }
