::tcl::tm::path add [file join ".." ".." "src"]
package require rmsd
package require io_read_all

proc test {} {
    set data [dict create \
            _ [dict create {1 PRO} 0.5 {2 SER} 0.7] \
    ]
    set expected [::_::io::read::all "expect/e2.txt"]
    set format txt

    set prefix "output/o2"
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
