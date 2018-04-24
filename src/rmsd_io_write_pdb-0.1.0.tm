## ============================================
## Write PDB files
## ============================================
## Args
## ============================================
## file_names ([str]): a list of output file names
## mol_ids (list): molecule IDs
## ============================================
## Returns (list): output file names
## ============================================
proc ::rmsd::io::write::pdb {file_names mol_ids} {
    set output {}
    if {[llength $file_names] != [llength $mol_ids]} {
        puts "ERROR HINT: you must specify [llength $mol_ids] output pdb file names"
    } else {
        foreach id $mol_ids f_name $file_names {
            ::animate write pdb $f_name $id
            lappend output $f_name
        }
    }
    return $output
}
