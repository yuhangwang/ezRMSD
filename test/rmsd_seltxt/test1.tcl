::tcl::tm::path add [file join ".." ".." "src"]
package require rmsd
package require load_molecule

proc test {} {
    set input {
        A {
            1 {CA C}
            2 {CA N}
        }
        B {
            1 {CA}
            2 {CA N}
        }
    }
    set expected [join \
        [list \
            "(chain A and ((resid 1 and name CA C) or (resid 2 and name CA N)))" \
            "(chain B and ((resid 1 and name CA) or (resid 2 and name CA N)))" \
        ] \
        " or " \
    ]

    set answer [::rmsd::seltxt $input]
    
    if {$answer == $expected} {
        puts ">>> PASS!"
    } else {
        puts ">>> FAILED!"
        puts "answer   = $answer"
        puts "expected = $expected"
    }
    puts $answer
}

test
exit