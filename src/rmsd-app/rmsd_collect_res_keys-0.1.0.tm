## ===========================================
## Collect the residue-keys for all chains
## ===========================================
## Args:
## rmsds (dict): an RMSD dict
## example:
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
## ===========================================
## Returns: a list of list of residue-keys
## for all chains
## ===========================================
proc ::rmsd::collect_res_keys {rmsds} {
    set output {}
    foreach chain_id [::dict keys $rmsds] {
        lappend output [::dict keys [::dict get $rmsds $chain_id]]
    }
    return $output
}
