::tcl::tm::path add [file join ".." ".." "src"]
package require set_intersect
package require list_compare

proc test {} {
    set set1 {A B C}
    set set2 {D E F}
    set expected {}
    set answer [::struct::set intersect $set1 $set2]
    if {[::list compare $answer $expected]} {
        puts "PASS!"
    } else {
        puts "FAILED!"
    }
}

test 
exit
