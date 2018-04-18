## =============================================
## Convert RMSD dict for a chain to a list
## =============================================
## Args:
## ---------------------------------------------
## d (dict): RMSD dict
##     e.g. { 
##        {1 PRO} 0.5 
##        {2 ALA} 0.5
##    }
## digital= false (bool): if true, only residue ID
##  and RMSD values will be returned
## =============================================
## Return: a list of RMSD values
##  e.g. {
##    {1 PRO 0.5}
##    {2 ALA 0.5}
## }
## =============================================
proc ::rmsd::d2l_chain {d {digital false}} {
    set output {}
    dict for {key rmsd_value} $d {
        if {$digital} {
            lassign $key resid resname
            lappend output [::list $resid $rmsd_value]
        } else {
            lappend output [::concat $key $rmsd_value]
        }
    }
    return $output
}
