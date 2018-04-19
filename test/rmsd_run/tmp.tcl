set d {}

set d {output {lst {}}}
dict set d output name1 a1
dict set d output name2 a2
lappend [dict get $d output lst] 1 2

puts $d