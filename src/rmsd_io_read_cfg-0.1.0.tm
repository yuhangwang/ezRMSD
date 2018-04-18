#! package require io_read_lines
#! package require fmap

## ===============================================
## Read a config file and return a dictionary
## ===============================================
## Args:
## cfg_file (str): input config file
## ===============================================
## Returns: a config dict
## ===============================================
proc ::rmsd::io::read::cfg_aux {line} {
    return [::_::fmap "string trim" [split $line ":"]]
}
proc ::rmsd::io::read::cfg {cfg_file} {
    set lines [::_::io::read::lines $cfg_file]
    return [concat {*}[::_::fmap ::rmsd::io::read::cfg_aux $lines]]
}
