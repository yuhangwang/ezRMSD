#! package require rmsd_io_read_cfg
#! package require 
##=======================================================
## Calculate overall RMSD values
##=======================================================
## Args:
## ---
## cfg_file (str): input configuration file
##=======================================================
proc ::rmsd::run {cfg_file} {
    set cfg [::rmsd::io read cfg $cfg_file]
    if {[::dict get $cfg rmsd] eq "all"} {

    }
}
