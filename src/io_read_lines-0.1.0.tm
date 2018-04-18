namespace eval ::_::io::read {}
## ===========================================
## Read all the content of the input file
## and return a list of lines
## ===========================================
## Args:
## file_name (str): input file name
## ===========================================
## Returns: a list of lines
## ===========================================
proc ::_::io::read::lines {file_name} {
    set f_in [open $file_name r]
    set output [split [string trim [read $f_in]] "\n"]
    close $f_in 
    return $output
}
