#! package require rmsd_io_read_cfg
#! package require rmsd_io_write_main
#! package require rmsd_io_write_pdb
#! package require rmsd_align
#! package require rmsd_calc_main
#! package require io_save_list
#! package require io_save_str
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
    set selections [::dict create]
    puts "[dict get $cfg selections align target]"
    if {[::dict get $cfg control align]} {
        ::dict set selections align [::rmsd::align \
            $id1 [::dict get $cfg selections align ref] \
            $id2 [::dict get $cfg selections align target] \
        ]
    } else {
        ::dict set selections align {}
    }
    puts "===== done selections"

    lassign [::rmsd::calc::main \
        $id1 [::dict get $cfg selections rmsd ref] \
        $id2 [::dict get $cfg selections rmsd target] \
        [::dict keys [::dict get $cfg outputs calc]] \
        false \
    ] results sel_rmsd

    ::dict set selections rmsd $sel_rmsd

    # Save aligned structures
    if {[::dict get $cfg control save-pdb]} {
        set out_pdbs [::rmsd::io::write::pdb \
            [list $id1 $id2]\
            [::dict get $cfg outputs pdb] \
        ]
    } else {
        set out_pdbs {}
    }
    

    # Save atom selections
    set out_sel [::dict create]
    foreach k [list align rmsd] {
        if {[::dict get $cfg control "save-selection-$k"]} {
            set out_prefix [::dict get $cfg outputs prefix]
            set f_out1 [format "%s_sel-${k}.txt" $out_prefix]
            set f_out2 [format "%s_sel-${k}.str.txt" $out_prefix]
            set sel [::dict get $selections $k]
            set out1 [::rmsd::data::collapse $sel]
            set out2 [::rmsd::seltxt $sel]
            ::dict set out_sel $k [list \
                [::_::io::save_list $f_out1 $out1] \
                [::_::io::save_str $f_out2 $out2] \
            ]
        }
    }

    return [concat \
        [::rmsd::io::write::main \
            [::dict get $cfg outputs prefix] \
            [::dict get $cfg outputs calc] \
            $results \
        ] \
        [::dict create pdb $out_pdbs] \
        [::dict create sel $out_sel] \
    ]
}
