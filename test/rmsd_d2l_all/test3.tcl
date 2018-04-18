::tcl::tm::path add [file join ".." ".." "src"]
package require rmsd
package require list_compare

proc test {} {
    set input {
        A  { {1 PRO} 0.5 {2 ALA} 0.5} 
        B  { {1 PRO} 0.7} 
    }
    set expected {
       {1 0.5}
       {2 0.5}
       {1 0.7}
    }
    set answer [::rmsd::d2l_all $input true]
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
