namespace eval ::_ {}
## ============================================
## Check whether an input is an black string
##  consisting of only white spaces
## ============================================
## Returns: true if non-empty; false otherwise
## ============================================
proc ::_::nonblank {x} {
    if {[string trim $x] ne ""} {
        return true
    } else {
        return false
    }
}

