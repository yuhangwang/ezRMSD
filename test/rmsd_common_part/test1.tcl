::tcl::tm::path add [file join ".." ".." "src"]
package require rmsd
package require vmd_io_load
package require dict_compare_list

proc test {} {
    set id1 [::vmd::io load "input/p1.pdb"]
    set id2 [::vmd::io load "input/p2.pdb"]
    set seltxt "all"
    set expected [dict create \
        A [dict create \
            {1 PRO} {N CA} \
            {2 ALA} {CA C} \
            {3 SER} {CA} \
            ]\
        B [dict create \
            {1 PRO} {N CA} \
            ] \
        C [dict create \
            {1 PRO} {C} \
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