::tcl::tm::path add [file join ".." ".." "src"]
package require rmsd
package require dict_compare_list

proc test {} {
    set id1 [::vmd::io load "input/p1.pdb"]
    set id2 [::vmd::io load "input/p2.pdb"]
    set seltxt "all"
    set expected [dict create \
        res [dict create \
            A [dict create {1 PRO} 0.5] \
        ] \
    ]

    set answer [::rmsd::calc::main $id1 $seltxt $id2 $seltxt {res}]
    
    if {$answer == $expected} {
        puts ">>> PASS!"
    } else {
        puts ">>> FAILED!"
    }
    puts "answer   = $answer"
    puts "expected = $expected"
    mol delete all
}

test
exit
