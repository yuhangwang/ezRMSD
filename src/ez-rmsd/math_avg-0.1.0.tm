namespace eval ::_::math {}
## ===================================================
## Calculate the average of a list of numbers
## ===================================================
## Args
## ===================================================
## xs ([T]): a list of values
## ===================================================
## Returns: a value
## ===================================================
proc ::_::math::avg {xs} {
    if {[llength $xs] == 0} {
        return 0
    } else {
        set sum 0.0
        set N [llength $xs]
        foreach x $xs {
            set sum [expr $sum + $x]
        }
        return [expr $sum / double($N)]
    }
}
