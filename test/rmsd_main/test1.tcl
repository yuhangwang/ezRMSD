::tcl::tm::path add [file join ".." ".." "src"]
package require rmsd
package require io_read_all
package require dict_compare_list

proc test {} {
    set cfg [::_::io::read::all "cfg/cfg1.tcl"]

    puts ">>=== [dict keys $cfg]"
    set expected [dict create \
        overall [list "output/out1_overall.dat"] \
        res [list \
            "output/out1_A.txt" \
            "output/out1_A.dat" \
        ]\
        avg [list "output/out1_avg.dat" \
            "output/out1_avg.txt" \
        ]\
        pdb [list \
            "output/out1_0.pdb" \
            "output/out1_1.pdb" \
        ]
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
