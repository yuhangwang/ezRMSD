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
## cfg_file (str): input configuration file
##=======================================================
proc ::rmsd::run {cfg_file} {
    set cfg [::rmsd::io read cfg $cfg_file]
    set id1 [::vmd::io load [::dict get $cfg input1]]
    set id2 [::vmd::io load [::dict get $cfg input2]]
    set output  [::dict get $cfg output]
    set seltxt1 [::dict get $cfg select1]
    set seltxt2 [::dict get $cfg select2]
    if {[::dict get $cfg rmsd] eq "all"} {
        set overall_rmsd [::rmsd calc all $id1 $seltxt1 $id2 $seltxt2]
        ::_::io::save_list $output $overall_rmsd
            
    }
    return $output
}
