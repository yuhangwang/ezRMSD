::tcl::tm::path add [file join ".." ".." "src"]
package require rmsd
package require list_compare

proc test {} {
    set input { {1 PRO} 0.5 {2 ALA} 0.5} 
    set expected {
       {1 PRO 0.5}
       {2 ALA 0.5}
    }
    set answer [::rmsd::d2l_chain $input]
    if {[::_::list compare $answer $expected]} {
        puts "PASS!"
    } else {
        puts "FAILED!"
    }
    puts ">>> answer = $answer"
    puts ">>> expected = $expected"
}

test 
exit
