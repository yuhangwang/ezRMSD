::tcl::tm::path add [file join ".." ".." "src"]
package require rmsd
package require dict_compare_list

proc test {} {
    set id1 [::vmd::io load "input/p1.pdb"]
    set id2 [::vmd::io load "input/p2.pdb"]
    
    set seltxt1 "all"
    set seltxt2 "all"
    set common [::rmsd::common_part $id1 $seltxt1 $id2 $seltxt2]
    set seltxt [::rmsd::seltxt $common]
    set ref    [::atomselect $id1 $seltxt]
    set target [::atomselect $id2 $seltxt]
    
    set expected [dict get {_ {_ 0.000}} _ _]

    set answer [dict get [rmsd calc all $ref $target $common] _ _]
    
    if {$answer == $expected} {
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
