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
        set tmp {}
        dict for {res_id atom_name_list} $res_dict {
            lappend tmp "(resid $res_id and name [join $atom_name_list])"
        }
        lappend output "(chain $chain_id and ([join $tmp " or "]))"
    }
    return [join $output " or "]
}
