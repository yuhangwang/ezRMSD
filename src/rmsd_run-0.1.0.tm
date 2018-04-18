#! package require rmsd_io_read_cfg
#! package require rmsd_calc_all
#! package require rmsd_calc_res
#! package require io_save_list
##=======================================================
## Calculate overall RMSD values
##=======================================================
## Args:
## ---
## cfg_file (str): input configuration file
##=======================================================
proc ::rmsd::run {cfg_file} {
    set cfg [::rmsd::io read cfg $cfg_file]
    set id1 []
    if {[::dict get $cfg rmsd] eq "all"} {
        set overall_rmsd [::rmsd calc all ]
        ::_::io::save_list \
            [::dict get $cfg output] \
            []
    }
}
