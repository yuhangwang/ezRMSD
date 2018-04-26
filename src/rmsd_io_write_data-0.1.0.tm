#! package require io_save_list
#! package require rmsd_data_collapse
## ============================================
## Save the RMSD values to output files
## ============================================
## Args
## ============================================
## format_type (str): data format extension name
## prefix (str): output file name prefix
## raw_data (dict): rmsd dict
## ============================================
## Returns (str): output file name
## ============================================
proc ::rmsd::io::write::data {format_type prefix raw_data} {
    if {$format_type eq "dat"} {
        set ext "data.txt"
        set data [::rmsd::data::collapse $raw_data true]
    } elseif {$format_type eq "txt"} {
        set ext "detail.txt"
        set data [::rmsd::data::collapse $raw_data false]
    } else {
        set ext "null.txt"
        puts "(::rmsd::io::write::data)"
        puts "=============================================="
        puts "WARNING: unsupported output data format \"$format_type\""
        puts "=============================================="
        set data {}
    }
    set file_name [format "%s.%s" $prefix $ext]

    return [::_::io::save_list $file_name $data]
}
