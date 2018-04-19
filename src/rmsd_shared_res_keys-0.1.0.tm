
## ======================================================
## Create a list of residue-keys shared by all chains
## ======================================================
## Args:
## ======================================================
## rmsds (dict): a dict of RMSD values
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
## ======================================================
## Returns: a list of residue-keys shared by all chains
## ======================================================
proc ::rmsd::shared_res_keys {rmsds} {
    set all_res_keys [::rmsd::collect_res_keys $rmsds]
    set base [lindex $all_res_keys 0]
    return [::_::fold ::struct::set_intersect $all_res_keys $base]
}
