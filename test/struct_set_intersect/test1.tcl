::tcl::tm::path add [file join ".." ".." "src"]
package require struct_set_intersect
package require list_compare

proc test {} {
    set set1 {A B C}
    set set2 {B C D}
    set expected {B C}
    set answer [::struct::set intersect $set1 $set2]
    if {[::_::list compare $answer $expected]} {
        puts "PASS!"
    } else {
        puts "FAILED!"
    }
}

test 
exit
