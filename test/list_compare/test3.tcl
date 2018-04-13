::tcl::tm::path add [file join ".." ".." "src"]
package require list_compare

proc test {} {
    set list1 {AB CD}
    set list2 {A B C D}
    set expected false
    if {[::_::list compare $list1 $list2] == $expected} {
        puts "PASS!"
    } else {
        puts "Failed!"
    }
}

test
exit