::tcl::tm::path add [file join ".." ".." "src"]
package require dict_list_compare

proc test {} {
    set dict1 [::dict create \
        A {1 2} \
        B {2 3} \
    ]
    set dict2 [::dict create \
        A {2 1} \
        B {2 3} \
    ]

    set expected true
    if {[::_::dict compare_list $dict1 $dict2] == $expected} {
        puts "PASS!"
    } else {
        puts "Failed!"
    }
}

test
exit