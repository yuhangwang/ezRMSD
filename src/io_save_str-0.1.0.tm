#----------------------------------------------------------------
# AUTHOR: YUHANG(STEVEN) WANG
# LINCENSE: MIT/X11
# DATE: 2016-10-27
#----------------------------------------------------------------
namespace eval ::_::io {}
#----------------------------------------------------------------
# Save a (nested) list into an output file
# 
# Arguments
#----------------------------------------------------------------
# output: output file
# data: a list of numbers or nested list of numbers
#----------------------------------------------------------------
proc ::_::io::save_str {output data} {
	set OUT [open $output w]
	puts $OUT $data
	close $OUT
    return $output
}
