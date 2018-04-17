::tcl::tm::path add [file join ".." ".." "src"]
package require rmsd
package require load_molecule

proc test {} {
    set input {
        A {
            {1 PRO} {CA C}
            {2 ALA} {CA N}
        }
        B {
            {1 PRO} {CA}
            {2 SER} {CA N}
        }
    }
    set expected [join \
        [list \
            "(chain A and ((resid 1 and resname PRO and name CA C) or (resid 2 and resname ALA and name CA N)))" \
            "(chain B and ((resid 1 and resname PRO and name CA) or (resid 2 and resname SER and name CA N)))" \
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
