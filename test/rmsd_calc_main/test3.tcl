::tcl::tm::path add [file join ".." ".." "src"]
package require rmsd
package require dict_compare_list

proc test {} {
    set id1 [::vmd::io load "input/p5.pdb"]
    set id2 [::vmd::io load "input/p6.pdb"]
    set seltxt "all"
    set expected [dict create \
        avg [dict create {1 PRO} 0.5] \
    ]

    set answer [::rmsd::calc::main $id1 $seltxt $id2 $seltxt {avg}]
    
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
