::tcl::tm::path add [file join ".." ".." "src"]
package require fmap
package require list_compare

proc show {x a b c} {
    return "$x - $a - $b - $c"
}
proc test {} {
    set in {a1 a2 a3}
    set params {1 2 3}
    set expected {"a1 - 1 - 2 - 3" "a2 - 1 - 2 - 3" "a3 - 1 - 2 - 3"}

    set answer [::_::fmap show $in {*}$params]
        
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
