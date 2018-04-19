::tcl::tm::path add [file join ".." ".." "src"]
package require fold
package require list_compare

proc add {x y} {
    return [expr $x + $y]
}

proc test {} {
    set in {1 1 1 1}
    set expected 4
    set answer [::_::fold add $in 0]
        
    if {$answer == $expected} {
        puts ">>> PASS!"
    } else {
        puts ">>> FAILED!"
    }
    puts "answer = $answer"
    puts "expected = $expected"
}
test
exit
