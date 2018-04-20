::tcl::tm::path add [file join ".." ".." "src"]
package require rmsd
package require list_compare

proc test {} {
    set input {_ {_ 0.2}}
    set expected 0.2
    set answer [::rmsd::data::collapse $input true]
    if {[::_::list compare $answer $expected]} {
        puts "PASS!"
    } else {
        puts "FAILED!"
    }
    puts ">>> answer   = $answer"
    puts ">>> expected = $expected"
}
test 
exit
