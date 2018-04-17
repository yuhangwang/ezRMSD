::tcl::tm::path add [file join ".." ".." "src"]
package require rmsd
package require load_molecule

proc test {} {
    set input {
        A {
            {1 PRO} {CA C}
            {2 SER} {CA N}
            {3 LYS} {}
        }
        B {}
    }
    set expected [join \
        [list \
            [concat "(chain A and ((resid 1 and resname PRO and name CA C)" \
                " or (resid 2 and resname SER and name CA N)))" \
            ]\
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