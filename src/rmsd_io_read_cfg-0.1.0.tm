## ===============================================
## Read a config file and return a dictionary
## ===============================================
## Args:
## cfg_file (str): input config file
## ===============================================
## Returns: a config dict
## ===============================================
proc ::rmsd::io::read::cfg {cfg_file} {
    set f_in [open $cfg_file r]
    set content [read $f_in]
    close $f_in
    set output [::dict create]
    foreach line [split $content "\n"] {
        lappend output [::_::fmap "string trim" [split $line ":"]]
    }
    return $output
}
