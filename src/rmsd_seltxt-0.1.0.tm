## =====================================================
## convert a chain-residue-atomName dict into an 
## atom selection string
## =====================================================
## Args:
## =====================================================
## d (dict): a dictionary of chainID-residueID-atomName
##  {
##     A {
##         1 {CA N C O}
##         2 {CA CB N C O}
##     }
##     B {
##         1 {CA}
##         2 {CA O}
##     }
## }
## =====================================================
## Return (str): an atom selection string
## =====================================================
proc ::rmsd::seltxt {d} {
    set output []
    dict for {chain_id res_dict} $d {
        if {[dict size $res_dict] > 0} {
            set tmp {}
            dict for {res_id atom_name_list} $res_dict {
                if {[llength $atom_name_list] > 0} {
                    lappend tmp "(resid $res_id and name [join $atom_name_list])"
                } else {}
            }
            if {[llength $tmp] > 0} {
                lappend output "(chain $chain_id and ([join $tmp " or "]))"
            } else {}
        } else {}
    }
    return [join $output " or "]
}
