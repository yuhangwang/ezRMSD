namespace eval ::_::io::read {}
## ===========================================
## Read all the content of the input file
## ===========================================
## Args:
## file_name (str): input file name
## ===========================================
## Returns: the content of the file as string
## ===========================================
proc ::_::io::read::all {file_name} {
    set f_in [open $file_name r]
    set output [read $f_in]
    close $f_in 
    return $output
}
