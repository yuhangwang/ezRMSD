::tcl::tm::path add [file join ".." ".." "src"]
package require list_compare

proc test {} {
    set list1 {1 2}
    set list2 {2 1}
    set expected true
    if {[::list compare $list1 $list2] == $expected} {
        puts "PASS!"
    } else {
        puts "Failed!"
    }
}

test
exit