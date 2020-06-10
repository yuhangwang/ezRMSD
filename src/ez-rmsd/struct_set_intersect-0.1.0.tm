## ========================================================
## Find the common elements between two lists
## ========================================================
## Args:
## ========================================================
## 
## ========================================================
namespace eval ::struct::set {
    namespace export intersect
    namespace ensemble create
}

proc ::struct::set::intersect {set1 set2} {
    set output {}
    foreach x $set1 {
        if {$x in $set2} {
            lappend output $x
        }
    }
    return $output
}
