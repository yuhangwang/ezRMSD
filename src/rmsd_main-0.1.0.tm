#! package require rmsd_io_read_cfg
#! package require rmsd_align
#! package require rmsd_calc_main
#! package require io_save_list
#! package require vmd_io_load
##=======================================================
## Calculate overall RMSD values
##=======================================================
## Args:
## ---
## cfg (dict): input configuration dictionary
##=======================================================
proc ::rmsd::main {cfg} {
    set id1 [::vmd::io load {*}[::dict get $cfg inputs ref]]
    set id2 [::vmd::io load {*}[::dict get $cfg inputs target]]

    if {[::dict get $cfg control align]} {
        ::rmsd::align \
            $id1 [::dict get $cfg selections ref    align] \
            $id2 [::dict get $cfg selections target align]
    }

    set results [::rmsd::calc::main \
        $id1 [::dict get $cfg selections ref    rmsd] \
        $id2 [::dict get $cfg selections target rmsd] \
    ]
    
    ::_::io::save_list $output $rmsd_values
    return $output
}
