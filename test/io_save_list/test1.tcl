::tcl::tm::path add [file join ".." ".." "src"]
package require io_read_all
package require io_save_list

proc test {} {
    set input {{1 2 3} {4 5 6}}
    set expected [::_::io::read::all "expect/f1.txt"]
    set answer [::_::io::read::all [::_::io::save_list "output/o1.txt" $input]]
        
    if {$answer eq $expected} {
        puts ">>> PASS!"
    } else {
        puts ">>> FAILED!"
    }
    puts "answer = $answer"
    puts "expected = $expected"
}
test
exit