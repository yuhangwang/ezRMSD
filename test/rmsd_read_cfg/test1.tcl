::tcl::tm::path add [file join ".." ".." "src"]
package require fmap
package require list_compare

proc test {} {
    set in {" a1 " "a2   " "     a3  "}
    set expected {a1 a2 a3}
    set answer [::_::fmap "string trim" $in]
        
    if {[::_::list::compare $answer $expected]} {
        puts ">>> PASS!"
    } else {
        puts ">>> FAILED!"
        puts "answer = $answer"
        puts "expected = $expected"
    }
    puts $answer
}
test
exit