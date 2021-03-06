::tcl::tm::path add [file join ".." ".." "src"]
package require rmsd
package require io_read_all

proc test {} {
    set inputs {
        "input/p1.pdb"
        "input/p2.pdb"
    }
    set params {
        {
            name "output/o1.pdb"
            selection all
        }
        {
            name "output/o2.pdb"
            selection all
        }
    }

    
    set ids {}
    foreach i $inputs {
        lappend ids [::vmd::io load $i]
    }
    
    set outputs [::rmsd::io::write::pdb $ids $params]
    
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
