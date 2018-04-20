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
##  {
##      overall {dat}
##      res {dat txt}
##      avg {dat txt}
##  }
## results (dict): a dict containing the results
## ============================================
## Returns (dict): a dictionary of output files
## ============================================
proc ::rmsd::io::write::main {prefix params results} {
    set output [::dict create]
    foreach k [::dict keys $params] {
        set formats [::dict get $params $k]

        if {$k eq "overall" || $k eq "avg"} {
            set raw_data [::dict get $results $k "_"]
            ::dict set output $k \
                [::_::fmap ::rmsd::io::write::data $formats "${prefix}_${k}" $raw_data]
        } elseif {$k eq "res"} {
            set output_files [::dict create]
            foreach chain_id [::dict keys $results] {
                set raw_data [::dict create \
                    $chain_id [::dict get $results $chain_id] \
                ]
                lappend output_files \
                    [::_::fmap ::rmsd::io::write::data $formats \
                        [list "${prefix}_${chain_id}" $raw_data] \
                    ]
            }
            ::dict set output $k [concat {*}$output_files]
        }
    }
    return $output
}