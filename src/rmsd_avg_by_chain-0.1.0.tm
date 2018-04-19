#! package require rmsd_collect_res_keys

## ======================================
## Save RMSD values by chain
## ======================================
## Args
## --------------------------------------
## rmsds (dict): a dictionary of RMSD values
## e.g.
## {
##     A {
##         {1 PRO} 0.5
##         {2 ALA} 0.6
##     }
##     B {
##         {1 PRO} 0.2
##         {2 ALA} 0.3
##     }
## }
## ======================================
## Returns: a dictionary of RMSD values
## per residue averaged over all chains.
## note: only those residues that are in common
## among chains are kept.
## ======================================
proc ::rmsd::avg_by_chain {rmsds} {
    set all_res_keys [::rmsd::collect_res_keys $rmsds]
    
}
