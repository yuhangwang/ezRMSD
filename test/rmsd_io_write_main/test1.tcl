::tcl::tm::path add [file join ".." ".." "src"]
package require rmsd
package require io_read_all

proc test {} {
    set results [dict create \
        res [dict create \
                A [dict create {1 PRO} 0.5 {2 SER} 0.7] \
                B [dict create {1 PRO} 0.5 {2 SER} 0.7] \
        ]\
        overall {_ {_ 0.112}} \
        avg {_ {{1 PRO} 0.8}} \
    ]
    set params {
        res {txt dat} 
        overall {dat}
        avg {txt dat}
    }
    set prefix "output/out"
    set expected [dict create\
        res [list "${prefix}_A.txt" "${prefix}_A.dat"] \
        overall "${prefix}_overall.dat" \
        avg [list "${prefix}_avg.txt" "${prefix}_avg.dat"] \
    ]

    set answer [::rmsd::io::write::main $prefix $params $results]
        
    if {$answer eq $expected} {
        puts ">>> PASS!"
    } else {
        puts ">>> FAILED!"
    }
    puts "answer   = $answer"
    puts "expected = $expected"
}
test
exit
