#! package require rmsd_io_read_cfg
#! package require rmsd_calc_all
#! package require rmsd_calc_res
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
    set cfg [::rmsd::io read cfg $cfg_file]
    set id1 [::vmd::io load [::dict get $cfg input1]]
    set id2 [::vmd::io load [::dict get $cfg input2]]
    set output  [::dict get $cfg output]
    set seltxt1 [::dict get $cfg select1]
    set seltxt2 [::dict get $cfg select2]
    set rmsd_type [::dict get $cfg rmsd]
    if {$rmsd_type eq "all"} {
        set rmsd_values [::rmsd calc all $id1 $seltxt1 $id2 $seltxt2]
    } elseif {$rmsd_type eq "residue"} {
        set rmsd_values [::rmsd::d2l_all [::rmsd calc res $id1 $seltxt1 $id2 $seltxt2]]
    } else {
        set rmsd_values {}
    }
    ::_::io::save_list $output $rmsd_values
    return $output
}
