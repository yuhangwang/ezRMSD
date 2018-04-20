::tcl::tm::path add [file join ".." ".." "src"]
package require rmsd
package require list_compare

proc test {} {
    set input {
        A  { {1 PRO} 0.5 {2 ALA} 0.5} 
        B  {} 
    }
    set expected {
       {A 1 PRO 0.5}
       {A 2 ALA 0.5}
    }
    set answer [::rmsd::data::collapse $input]
    if {[::_::list compare $answer $expected]} {
        puts "PASS!"
    } else {
        puts "FAILED!"
    }
}

test 
exit
