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
    set commonChainIDs [::rmsd::common_chains $id1 $seltxt1 $id2 $seltxt2]
    set resDict [::rmsd::common_residues \
        $id1 $seltxt1 $id2 $seltxt2 \
        $commonChainIDs \
    ]
    set output {}
    foreach chainId [::dict keys $resDict] {
        set resIDs [::dict get $resDict $chainId]
        if {[llength $resIDs] > 0} {
            lappend output "(chain $chainId and resid [join $resIDs])"
        }
    }
    return [join $output " or "]
}
