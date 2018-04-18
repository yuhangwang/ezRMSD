#----------------------------------------------------------------
# AUTHOR: YUHANG(STEVEN) WANG
# LINCENSE: MIT/X11
# DATE: 2016-10-27
#----------------------------------------------------------------
namespace eval ::_ {}
#----------------------------------------------------------------
# Save a (nested) list into an output file
# 
# Arguments
#----------------------------------------------------------------
# output: output file
# data: a list of numbers or nested list of numbers
#----------------------------------------------------------------
proc ::_::save_list {output data} {
	set OUT [open $output w]
	foreach d $data { puts $OUT [join $d] }
	close $OUT
}
