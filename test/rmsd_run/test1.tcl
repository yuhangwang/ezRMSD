::tcl::tm::path add [file join ".." ".." "src"]
package require rmsd
package io_read_all

proc test {} {
    
        
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