#! package require rmsd_main
#! package require io_read_all
##=======================================================
## Calculate overall RMSD values
##=======================================================
## Args:
## ---
## cfg_file (str): input configuration file
##=======================================================
proc ::rmsd::run {cfg_file} {
    return [::rmsd::main [::_::io::read::all $cfg_file]]
}
