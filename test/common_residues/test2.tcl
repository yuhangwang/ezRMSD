::tcl::tm::path add [file join ".." ".." "src"]
package require rmsd
package require load_molecule
package require dict_compare_list

proc test {} {
    set id1 [::umolflow::loadMolecule "input/p1.pdb"]
    set id2 [::umolflow::loadMolecule "input/p3.pdb"]
    set seltxt "all"
    set chainIDs {}
    set expected {}

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