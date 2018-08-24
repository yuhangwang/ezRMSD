## ==========================================================
## check whether two lists are the same
## ==========================================================
## Args:
## ==========================================================
## list1 (list): input list 1
## list2 (list): input list 2
## ==========================================================
## Returns (bool): true or false
## ==========================================================
namespace eval ::_::list {
    namespace export compare
    namespace ensemble create
}

proc ::_::list::compare {list1 list2} {
    set s1 [lsort -ascii $list1]
    set s2 [lsort -ascii $list2]
    if {[join $s1] == [join $s2]} {
        return true
    } else {
        return false
    }
}
