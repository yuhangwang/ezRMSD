## ============================================
## Write PDB files
## ============================================
## Args
## ============================================
## mol_ids (list): molecule IDs
## params ([str]): a list of output file names
## ============================================
## Returns (list): output file names
## ============================================
proc ::rmsd::io::write::pdb {mol_ids params} {
    set output {}
    if {[llength $params] != [llength $mol_ids]} {
        puts "ERROR HINT: you must specify [llength $mol_ids] output pdb file names"
    } else {
        foreach id $mol_ids p $params {
            set f_name [::dict get $p name]
            set sel_str [::dict get $p selection]
            set sel_obj [::atomselect $id "$sel_str"]
            ::animate write pdb $f_name sel $sel_obj $id
            $sel_obj delete
            lappend output $f_name
        }
    }
    return $output
}
