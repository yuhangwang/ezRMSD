::tcl::tm::path add [file join ".." ".." "src"]
package require rmsd
package require dict_compare_list

proc test {} {
    set id1 [::vmd::io load "input/p1.pdb"]
    set id2 [::vmd::io load "input/p2.pdb"]
    set seltxt "all"
    set expected 0.0

    set answer [rmsd calc all $id1 $seltxt $id2 $seltxt]
    
    if {$answer == $expected} {
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