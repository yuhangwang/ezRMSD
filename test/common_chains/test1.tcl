::tcl::tm::path add [file join ".." ".." "src"]
package require ezRMSD
package require load_molecule

proc test {} {
    set id1 [::umolflow::loadMolecule "input/p1.pdb"]
    set id2 [::umolflow::loadMolecule "input/p2.pdb"]
    set seltxt "all"
    set expected "chain B C"

    set answer [::ezRMSD::common_chains $id1 $seltxt $id2 $seltxt]
    if {$answer == $expected} {
        puts "PASS!"
    } else {
        puts "FAILED!"
        puts "answer = $answer"
        puts "expected = $expected"
    }
    mol delete all
}

test
exit