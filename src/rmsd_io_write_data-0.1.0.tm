#! package require io_save_list
#! package require rmsd_data_collapse
## ============================================
## Save the RMSD values to output files
## ============================================
## Args
## ============================================
## format (str): data format
## prefix (str): output file name prefix
## raw_data (dict): rmsd dict
## ============================================
## Returns (str): output file name
## ============================================
proc ::rmsd::io::write::data {format prefix raw_data} {
    set file_name [format "%s.%s" $prefix $ext]
    if {$ext eq "dat"} {
        set data [::rmsd::data::collapse $raw_data true]
    } elseif {$ext eq "txt"} {
        set data [::rmsd::data::collapse $raw_data false]
    }
    return [::_::io::save_list $file_name $data]
}
