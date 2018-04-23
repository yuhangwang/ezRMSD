::tcl::tm::path add [file join ".." ".." "src"]
package require rmsd
package require io_read_all
package require dict_compare_list

proc test {} {
    set cfg [::_::io::read::all "cfg/cfg2.tcl"]
    set prefix "output/out2"
    set expected [dict create \
        overall [list "${prefix}_overall.data.txt"] \
        res [list \
            "${prefix}_A.detail.txt" \
            "${prefix}_A.data.txt" \
            "${prefix}_B.detail.txt" \
            "${prefix}_B.data.txt" \
        ]\
        avg [list "${prefix}_avg.data.txt" \
            "${prefix}_avg.detail.txt" \
        ]\
        pdb {} \
        sel [::dict create \
            align  [list \
                "${prefix}_sel-align.txt" \
                "${prefix}_sel-align.str.txt" \
            ] \
            rmsd  [list \
                "${prefix}_sel-rmsd.txt" \
                "${prefix}_sel-rmsd.str.txt" \
            ]\
        ] \
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
