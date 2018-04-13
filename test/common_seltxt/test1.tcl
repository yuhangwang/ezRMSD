::tcl::tm::path add [file join ".." ".." "src"]
package require rmsd
package require load_molecule

proc test {} {
    set id1 [::umolflow::loadMolecule "input/p1.pdb"]
    set id2 [::umolflow::loadMolecule "input/p2.pdb"]
    set seltxt "all"
    set expected "(chain A and resid 2 3) or (chain B and resid 2 3) or (chain C and resid 4)"

    set answer [::rmsd::common_seltxt $id1 $seltxt $id2 $seltxt]
    
    if {$answer == $expected} {
        puts ">>> PASS!"
    } else {
        puts ">>> FAILED!"
        puts "answer = $answer"
        puts "expected = $expected"
    }
    mol delete all
}

test
exit