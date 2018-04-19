::tcl::tm::path add [file join ".." ".." "src"]
package require rmsd
package require list_compare

proc test {} {
    set in {
        A {
            {1 PRO} 0.1
            {2 ALA} 0.2
        }
        B {
            {2 LYS} 0.1
            {3 SER} 0.1
        }
    }
    set expected {{{1 PRO} {2 ALA}} {{2 LYS} {3 SER}}}
    set answer [::rmsd::collect_res_keys $in]
        
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