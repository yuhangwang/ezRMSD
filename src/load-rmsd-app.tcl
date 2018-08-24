#----------------------------------------------------------------
# Calculate the RMSD between two structures
#----------------------------------------------------------------
# AUTHOR: YUHANG (STEVEN) WANG
# LINCENSE: MIT/X11
# DATE: 8/23/2018
#----------------------------------------------------------------
::tcl::tm::path add [file join [pwd] "rmsd-app"]
::tcl::tm::path list
puts [::tcl::tm::path list]
package require rmsd
package require fmap