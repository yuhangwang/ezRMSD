::tcl::tm::path add [file join ".." ".." "src"]
package require rmsd
package require io_read_all

proc test {} {
    set data [dict create \
            A [dict create {1 PRO} 0.5 {2 SER} 0.7] \
    ]
    set expected [::_::io::read::all "expect/e1.dat"]
    set format dat

    set prefix "output/o1"
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
