::tcl::tm::path add [file join ".." ".." "src"]
package require rmsd
package require load_molecule
package require dict_compare_list

proc test {} {
    set id1 [::umolflow::loadMolecule "input/p1.pdb"]
    set id2 [::umolflow::loadMolecule "input/p2.pdb"]
    set chainIDs {A B C}
    set seltxt "all"
    set expected [dict create \
        A {2 3} \
        B {2 3} \
        C {4} \
    ]

    set answer [::rmsd::common_residues $id1 $seltxt $id2 $seltxt $chainIDs]
    
    if {[::_::dict compare_list $answer $expected]} {
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