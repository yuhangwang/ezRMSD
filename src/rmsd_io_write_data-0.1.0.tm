#! package require io_save_list
#! package require rmsd_data_collapse
## ============================================
## Save the RMSD values to output files
## ============================================
## Args
## ============================================
## ext (str): data format extension name
## prefix (str): output file name prefix
## raw_data (dict): rmsd dict
## ============================================
## Returns (str): output file name
## ============================================
proc ::rmsd::io::write::data {ext prefix raw_data} {
    set file_name [format "%s.%s" $prefix $ext]
    if {$ext eq "dat"} {
        set data [::rmsd::data::collapse $raw_data true]
    } elseif {$ext eq "txt"} {
        set data [::rmsd::data::collapse $raw_data false]
    } else {
        puts "(::rmsd::io::write::data)"
        puts "=============================================="
        puts "WARNING: unsupported output data type \"$ext\""
        puts "=============================================="
        set data {}
    }

    puts ">>> $file_name"
    return [::_::io::save_list $file_name $data]
}
