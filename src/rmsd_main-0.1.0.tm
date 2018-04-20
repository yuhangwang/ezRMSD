#! package require rmsd_io_read_cfg
#! package require rmsd_io_write_main
#! package require rmsd_io_write_pdb
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
        [::dict keys [::dict get $cfg outputs calc]] \
        false \
    ]

    if {[::dict get $cfg control save-pdb]} {
        ::rmsd::io::write::pdb [::dict get $cfg outputs prefix] [list $id1 $id2]
    }
    
    return [::rmsd::io::write::main \
        [::dict get $cfg outputs prefix] \
        [::dict get $cfg outputs calc] \
        $results \
        [::dict create ref $id1 target $id2] \
    ]
}
