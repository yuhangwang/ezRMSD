::tcl::tm::path add [file join ".." ".." "src"]
package require rmsd
package require io_read_all
package require dict_compare_list

proc test {} {
    set cfg "cfg/cfg2.tcl"
    set prefix "output/out2"
    set expected [dict create \
        overall [list "${prefix}_overall.dat"] \
        res [list \
            "${prefix}_A.txt" \
            "${prefix}_A.dat" \
            "${prefix}_B.txt" \
            "${prefix}_B.dat" \
        ]\
        avg [list "${prefix}_avg.dat" \
            "${prefix}_avg.txt" \
        ]\
        pdb {} \
    ]

    set answer [::rmsd::run $cfg]
        
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
