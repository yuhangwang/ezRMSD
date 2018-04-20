## ============================================
## Write PDB files
## ============================================
## Args
## ============================================
## prefix (str): output file name
## mol_ids (list): molecule IDs
## ============================================
## Returns (list): output file names
## ============================================
proc ::rmsd::io::write::pdb {prefix mol_ids} {
    set output {}
    foreach id $mol_ids {
        set file_name [format "%s_%d.pdb" $prefix $id]
        lappend output $file_name
        ::animate write pdb $file_name $id
    }
    return $output
}
