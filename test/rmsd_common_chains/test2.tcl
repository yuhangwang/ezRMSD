::tcl::tm::path add [file join ".." ".." "src"]
package require rmsd
package require vmd_io_load

proc test {} {
    set id1 [::vmd::io load "input/p1.pdb"]
    set id2 [::vmd::io load "input/p3.pdb"]
    set seltxt "all"
    set expected {}

    set answer [::rmsd::common_chains $id1 $seltxt $id2 $seltxt]
    if {$answer == $expected} {
        puts ">>> PASS!"
    } else {
        puts ">>> FAILED!"
        puts "answer = $answer"
        puts "expected = $expected"
    }
    mol delete all
}

test
exit
