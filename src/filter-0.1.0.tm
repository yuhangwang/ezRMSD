namespace eval ::_ {}
## ============================================
## Apply a filter function to a list
## and only collect items that the filter
## functions returns true.
## ============================================
## Args:
## f (func): function which returns true or false
## xs (list): a list
## ============================================
## Returns: a new list
## ============================================
proc ::_::filter {f xs} {
    set output {}
    foreach x $xs {
        if {[{*}[split $f] $x]} {
            lappend output $x
        }
    }
    return $output
}
