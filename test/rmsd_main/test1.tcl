::tcl::tm::path add [file join ".." ".." "src"]
package require rmsd
package require io_read_all
package require dict_compare_list

proc test {} {
    set cfg [::_::io::read::all "cfg/cfg1.tcl"]

    set expected [dict create \
        overall [list "output/out1_overall.data.txt"] \
        res [list \
            "output/out1_A.detail.txt" \
            "output/out1_A.data.txt" \
        ]\
        avg [list "output/out1_avg.data.txt" \
            "output/out1_avg.detail.txt" \
        ]\
        pdb [list \
            "output/out1_ref_aligned.pdb" \
            "output/out1_target_aligned.pdb" \
        ] \
        sel {} \
    ]

    set answer [::rmsd::main $cfg]
        
    if {[::_::dict::compare_list $answer $expected]} {
        puts ">>> PASS!"
    } else {
        puts ">>> FAILED!"
    }
    puts "answer   = $answer"
    puts "expected = $expected"
}
test
exit
