#! package require rmsd_shared_res_keys
#! package require fmap
#! package require math_avg

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
    set shared_keys [::rmsd::shared_res_keys $rmsds]
    set output {}
    foreach chain_id $rmsds {
        set d [::dict get $rmsds $chain_id]
        foreach key $shared_keys {
            ::dict lappend output $key [::dict get $d $key]
        }
    }
    return [::_::fmap ::_::math::avg $output]
}
