#! package require io_save_list
#! package require rmsd_d2l_all
#! package require rmsd_d2l_chain
## ============================================
## Save the RMSD values to output files
## ============================================
## Args
## ============================================
## output_prefix (str): output prefix
## params (dict): output types and output formats
##  e.g.
##  calc {
##      overall {dat}
##      res {dat txt pdb}
##      avg {dat txt pdb}
##  }
## ============================================
## Returns (dict): a dictionary of output files
## ============================================
proc ::rmsd::io::write::main {output_prefix params results mol_ids} {
    set output [::dict create]
    foreach k [::dict keys $params] {
        set formats [::dict get $params $k]
        foreach ext $formats {
            if {$ext eq "dat"} {
                set file_name [format "%s.%s" $output_prefix $ext]
                if {$k eq "overall"} {
                    set data [::dict get $results $k]
                } elseif {$k eq "res"} {
                    set data 
                }
                ::_::io::save_list $file_name $data
                ::dict lappend output $k $file_name
            }
        }
    }
}
