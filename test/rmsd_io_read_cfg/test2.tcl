::tcl::tm::path add [file join ".." ".." "src"]
package require rmsd

proc test {} {
    set in "input/f2.txt"
    set expected [::dict create \
        output out.dat \
        input1 in1.pdb \
        input2 in2.pdb \
        selection1 {chain A and resid 10 to 100} \
        selection2 {chain B and noh} \
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
    puts ">> expected = $expected"
    puts ">> answer = $answer"
}
test
exit