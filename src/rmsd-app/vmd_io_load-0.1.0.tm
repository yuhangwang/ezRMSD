#----------------------------------------------------------------
# AUTHOR: YUHANG(STEVEN) WANG
# LINCENSE: MIT/X11
# DATE: 2016-10-27
#----------------------------------------------------------------
namespace eval ::vmd::io {
    namespace export load
    namespace ensemble create
}
#----------------------------------------------------------------
# Load a molecule and return the molecule ID
#
# Arguments
#----------------------------------------------------------------
# Accept variable number of arguments.
# The first molecule file is given to "mol new"
# and the rest are given to "mol addfile" with option "waitfor all"
#----------------------------------------------------------------
proc ::vmd::io::load {args} {
    if {[llength $args] == 0} {
        return -1
    } else {
        set mol_id [::mol new [lindex $args 0]]
        foreach f [lrange $args 1 end] {
            ::mol addfile $f waitfor all $mol_id
        }
        return $mol_id
    }
}
