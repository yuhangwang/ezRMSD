::tcl::tm::path add [file join ".." ".." "src"]
package require filter
package require list_compare

proc not_null {x} {
    if {$x ne ""} {
        return true
    } else {
        return false
    }
}

proc test {} {
    set in [list a1 {}  a2 {} {} a3]
    set expected {a1 a2 a3}
    set answer [::_::filter not_null $in]
        
    if {[::_::list::compare $answer $expected]} {
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