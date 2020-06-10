namespace eval ::_ {}
## ===================================================
## Apply a function to a list to reduce it to a value
## ===================================================
## Args
## ===================================================
## f (function): a function that takes two arguments
## xs ([T]): a list of values
## base (T): a base case value
## ===================================================
## Returns: a value
## ===================================================
proc ::_::fold {f xs base} {
    if {[llength $xs] == 0} {
        return $base
    } else {
        set last $base
        foreach x $xs {
            set last [$f $last $x]
        }
        return $last
    }
}
