::tcl::tm::path add [file join ".." ".." "src"]
package require rmsd
package require io_read_all

proc test {} {
    set inputs {
        "input/p1.pdb"
    }
    set expected {
        "expected/part1.pdb"
    }
    set params {
        {
            name "output/test2_o1.pdb"
            selection "resid 2 and chain A"
        }
    }

    
    set ids {}
    foreach i $inputs {
        lappend ids [::vmd::io load $i]
    }
    
    set outputs [::rmsd::io::write::pdb $ids $params]
    
    foreach f $outputs i $expected {
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
