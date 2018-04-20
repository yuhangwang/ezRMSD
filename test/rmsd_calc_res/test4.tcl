::tcl::tm::path add [file join ".." ".." "src"]
package require rmsd
package require dict_compare_list

proc test {} {
    set id1 [::vmd::io load "input/p5.pdb"]
    set id2 [::vmd::io load "input/p6.pdb"]

    set seltxt1 "all"
    set seltxt2 "all"
    set common [::rmsd::common_part $id1 $seltxt1 $id2 $seltxt2]
    set seltxt [::rmsd::seltxt $common]
    set ref    [::atomselect $id1 $seltxt]
    set target [::atomselect $id2 $seltxt]

    set expected1 {0.5 0.5 0.5 0.5 0.5 0.5}
    set expected2 {0.5 0.5 0.5 0.5 0.5 0.5}

    set _ [rmsd calc res $ref $target $common]

    set sel1 [atomselect $id1 all]
    set sel2 [atomselect $id2 all]
    set answer1 [$sel1 get beta]
    set answer2 [$sel2 get beta]
    
    if {$answer1 == $expected1 && $answer2 == $expected2} {
        puts ">>> PASS!"
    } else {
        puts ">>> FAILED!"
    }
    puts "answer1   = $answer1"
    puts "expected1 = $expected1"
    puts "answer2   = $answer2"
    puts "expected2 = $expected2"
    mol delete all
}

test
exit
