::tcl::tm::path add [file join ".." ".." "src"]
package require rmsd
package require load_molecule
package require dict_compare_list

proc test {} {
    set id1 [::umolflow::loadMolecule "input/p1.pdb"]
    set id2 [::umolflow::loadMolecule "input/p2.pdb"]
    set seltxt "all"
    set expected [dict create \
        A [dict create \
            1 {N CA} \
            2 {CA C} \
            3 {CA} \
            ]\
        B [dict create \
            1 {N CA} \
            ] \
        C [dict create \
            1 {C} \
            ] \
    ]

    set answer [::rmsd::common_part $id1 $seltxt $id2 $seltxt]
    
    if {[::_::dict compare_list $answer $expected]} {
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