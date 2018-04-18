## =============================================
## Convert RMSD dict to a list
## =============================================
## Args:
## ---------------------------------------------
## d (dict): RMSD dict
##     e.g. {
##        A  { {1 PRO} 0.5 {2 ALA} 0.5} \
##        B  { {1 PRO} 0.5} \
##    }
## digital= false (bool): if true, only residue ID
##  and RMSD values will be returned
## =============================================
## Return: a list of RMSD values
##  e.g. {
##    {A 1 PRO 0.5}
##    {A 2 ALA 0.5}
##    {B 1 PRO 0.5}
## }
## =============================================
proc ::rmsd::d2l_all {d {digital false}} {
    set output {}
    dict for {chain_id items} $d {
        dict for {key rmsd_value} $items {
            if {$digital} {
                lassign $key resid resname
                lappend output [::list $resid $rmsd_value]
            } else {
                lappend output [::concat $chain_id $key $rmsd_value]
            }
        }
    }
    return $output
}
