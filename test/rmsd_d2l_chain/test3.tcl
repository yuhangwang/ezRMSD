::tcl::tm::path add [file join ".." ".." "src"]
package require rmsd
package require list_compare

proc test {} {
    set input {    }
    set expected {}
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
