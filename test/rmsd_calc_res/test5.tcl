::tcl::tm::path add [file join ".." ".." "src"]
package require rmsd
package require load_molecule
package require dict_compare_list

proc test {} {
    set id1 [::umolflow::loadMolecule "input/p5.pdb"]
    set id2 [::umolflow::loadMolecule "input/p6.pdb"]
    set seltxt "all"
    set expected1 {1.0 1.0 1.0 1.0 1.0 1.0}
    set expected2 {2.0 2.0 2.0 2.0 2.0 2.0}

    set _ [rmsd calc res $id1 $seltxt $id2 $seltxt true false]

    set sel1 [atomselect $id1 all]
    set sel2 [atomselect $id2 all]
    set answer1 [$sel1 get beta]
    set answer2 [$sel2 get beta]
    
    if {$answer1 == $expected1 && $answer2 == $expected2} {
        puts ">>> PASS!"
    } else {
        puts ">>> FAILED!"
    }
    puts "answer1   = $answer1"
    puts "expected1 = $expected1"
    puts "answer2   = $answer2"
    puts "expected2 = $expected2"
    mol delete all
}

test
exit
