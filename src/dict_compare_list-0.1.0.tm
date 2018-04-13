package require list_compare
## ==========================================================
## check whether two dict where each element contains a dict
## ==========================================================
## Args:
## ==========================================================
## dict1 (dict): input dict 1
## dict2 (dict): input dict 2
## ==========================================================
## Returns (bool): true or false
## ==========================================================
namespace eval ::_::dict {
    namespace export compare_list
    namespace ensemble create
}

proc ::_::dict::compare_list {dict1 dict2} {
    set keys1 [dict keys $dict1]
    set keys2 [dict keys $dict2]
    if {[::_::list compare $keys1 $keys2]} {
        foreach k $keys1 {
            set list1 [dict get $dict1 $k]
            set list2 [dict get $dict2 $k]
            if {![::_::list compare $list1 $list2]} {
                return false
            } else {}
        }
    } else {
        return false
    }
    return true
}
