::tcl::tm::path add [file join ".." ".." "src"]
package require rmsd
package require io_read_all

proc test {} {
    set inputs [list "input/p1.pdb" "input/p2.pdb"]
    set ids {}
    foreach i $inputs {
        lappend ids [::vmd::io load $i]
    }
    
    set prefix "output/o"
    set outputs [::rmsd::io::write::pdb $prefix $ids]
    
    foreach f $outputs i $inputs {
        puts ">> $f $i"
        set expected [::_::io::read::all $i]
        set answer   [::_::io::read::all $f]

        if {$answer == $expected} {
            puts ">>> PASS!"
        } else {
            puts ">>> FAILED!"
        }
        puts "answer = $answer"
        puts "expected = $expected"
    }
    
    mol delete all
}

test
exit
