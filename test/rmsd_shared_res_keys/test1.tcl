::tcl::tm::path add [file join ".." ".." "src"]
package require rmsd
package require list_compare

proc test {} {
    set in {
        A {
            {1 PRO} 0.1
            {2 ALA} 0.2
            {5 TYR} 0.6
            {10 LYS} 0.9
        }
        B {
            {1 PRO} 0.15
            {2 ALA} 0.6
            {3 SER} 0.3
            {4 GLY} 0.4
            {5 TYR} 0.8
        }
    }
    set expected {{1 PRO} {2 ALA} {5 TYR}}
    set answer [::rmsd::shared_res_keys $in]
        
    if {[::_::list::compare $answer $expected]} {
        puts ">>> PASS!"
    } else {
        puts ">>> FAILED!"
    }
    puts "answer = $answer"
    puts "expected = $expected"
}
test
exit