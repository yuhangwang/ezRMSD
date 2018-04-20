#! package require io_save_list
#! package require rmsd_data_collapse
#! package require fmap
## ============================================
## Save the RMSD values to output files
## ============================================
## Args
## ============================================
## prefix (str): output prefix
## params (dict): output types and output formats
##  e.g.
##  calc {
##      overall {dat}
##      res {dat txt}
##      avg {dat txt}
##  }
## ============================================
## Returns (dict): a dictionary of output files
## ============================================
proc ::rmsd::io::write::main {prefix params results mol_ids} {
    set output [::dict create]
    foreach k [::dict keys $params] {
        set formats [::dict get $params $k]
        set raw_data [::dict get $results $k]

        if {$k eq "overall"} {
            ::dict set output $k [::_::fmap ::rmsd::io::write::data $prefix]
        }


        foreach ext $formats {
            if {$ext eq "dat"} {
                set file_name [format "%s.%s" $prefix $ext]
                set data [::rmsd::data::collapse $raw_data true]
                ::_::io::save_list $file_name $data
                ::dict lappend output $k $file_name
            } elseif {$ext eq "txt"}
        }
    }
}
