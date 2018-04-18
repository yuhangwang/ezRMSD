::tcl::tm::path add [file join ".." ".." "src"]
package require rmsd
package require io_read_all

proc test {} {
    set answer [::_::io::read::all [::rmsd run "cfg/cfg1.txt"]]
    set expected [::_::io::read::all "expect/e1.txt"]
        
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