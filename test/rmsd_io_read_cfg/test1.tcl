::tcl::tm::path add [file join ".." ".." "src"]
package require rmsd

proc test {} {
    set in "input/f1.txt"
    set expected [::dict create \
        output out.dat \
        input1 in1.pdb \
        input2 in2.pdb \
        average true \
    ]
    set answer [::rmsd::io read cfg $in]
        
    if {$answer eq $expected} {
        puts ">>> PASS!"
    } else {
        puts ">>> FAILED!"
        puts "answer = $answer"
        puts "expected = $expected"
    }
    puts $answer
}
test
exit