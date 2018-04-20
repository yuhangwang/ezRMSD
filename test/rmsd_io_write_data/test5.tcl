::tcl::tm::path add [file join ".." ".." "src"]
package require rmsd
package require io_read_all

proc test {} {
    set data  {_ {_ 0.5}}
    set expected [::_::io::read::all "expect/e3.txt"]
    set format txt

    set prefix "output/o3_overall"
    set answer [::_::io::read::all [::rmsd::io::write::data $format $prefix $data]]
        
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
