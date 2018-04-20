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
## numeric= false (bool): if true, only residue ID
##  and RMSD values will be returned
## Note: if the key is "_", it will be ignored
## =============================================
## Return: a list of RMSD values
##  e.g. {
##    {A 1 PRO 0.5}
##    {A 2 ALA 0.5}
##    {B 1 PRO 0.5}
## }
## =============================================
proc ::rmsd::data::collapse {d {numeric false}} {
    set output {}
    dict for {chain_id items} $d {
        if {$chain_id eq "_"} {
            set chain_id ""
        }
        dict for {key rmsd_value} $items {
            if {$key eq "_"} {
                set resid ""
                set resname ""
            } else {
                lassign $key resid resname
            }

            if {$numeric} {
                lappend output [::concat $resid $rmsd_value]
            } else {
                lappend output [::concat $chain_id $resid $resname $rmsd_value]
            }
        }
    }
    return $output
}
