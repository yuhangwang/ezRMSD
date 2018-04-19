::tcl::tm::path add [file join ".." ".." "src"]
package require math_avg
package require list_compare

proc test {} {
    set in {1 2 3 4 5 6 7 8 9}
    set expected 5.0
    set answer [::_::math::avg $in]
        
    if {$answer == $expected} {
        puts ">>> PASS!"
    } else {
        puts ">>> FAILED!"
    }
    puts "answer   = $answer"
    puts "expected = $expected"
}
test
exit