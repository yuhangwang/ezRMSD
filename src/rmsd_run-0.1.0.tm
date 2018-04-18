#! package require rmsd_main
##=======================================================
## Calculate overall RMSD values
##=======================================================
## Args:
## ---
## cfg_file (str): input configuration file
##=======================================================
proc ::rmsd::run {cfg_file} {
    return [::rmsd::main [::rmsd::io read cfg $cfg_file]]
}
