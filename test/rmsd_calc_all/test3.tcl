::tcl::tm::path add [file join ".." ".." "src"]
package require rmsd
package require load_molecule
package require dict_compare_list

proc test {} {
    set id1 [::vmd::io load "input/p3.pdb"]
    set id2 [::vmd::io load "input/p4.pdb"]
    
    set seltxt1 "all"
    set seltxt2 "all"
    set common [::rmsd::common_part $id1 $seltxt1 $id2 $seltxt2]
    set seltxt [::rmsd::seltxt $common]
    set ref    [::atomselect $id1 $seltxt]
    set target [::atomselect $id2 $seltxt]

    set expected [expr sqrt(0.5)]
    set tol 1e-5

    set answer [rmsd calc all $ref $target $common]
    
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