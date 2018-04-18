::tcl::tm::path add [file join ".." ".." "src"]
package require io_read_lines

proc test {} {
    set in "input/f1.txt"
    set expected {{1 2 3} {4 5 6}}
    set answer [::_::io::read::lines $in]
        
    if {$answer eq $expected} {
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