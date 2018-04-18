::tcl::tm::path add [file join ".." ".." "src"]
package require rmsd
package require load_molecule
package require dict_compare_list

proc test {} {
    set id1 [::vmd::io load "input/p3.pdb"]
    set id2 [::vmd::io load "input/p4.pdb"]
    set seltxt "all"
    set expected [expr sqrt(0.5)]
    set tol 1e-5

    set answer [rmsd calc all $id1 $seltxt $id2 $seltxt false]
    
    if {[expr $answer - $expected] < $tol} {
        puts ">>> PASS!"
    } else {
        puts ">>> FAILED!"
        puts "answer = $answer"
        puts "expected = $expected"
    }
    puts $answer
    mol delete all
}

test
exit