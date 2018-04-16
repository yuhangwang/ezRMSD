##=======================================================
## Calculate overall RMSD values
##=======================================================
## Args:
## -----
## id1 (int): molecule ID for the first molecule
## seltxt1 (str): atom selection string for the first molecule
## id2 (int): molecule ID for the second molecule
## seltxt2 (str): atom selection string for the second molecule
## do_align = true (bool): (optional) if true, alignment will be done
##=======================================================
proc ::rmsd::calc::all {id1 seltxt1 id2 seltxt2 {do_align true}} {
    set common [::rmsd::common_part $id1 $seltxt1 $id2 $seltxt2]
    set seltxt_common [::rmsd::seltxt $common]
    set ref    [::atomselect $id1 "$seltxt_common"]
    set target [::atomselect $id2 "$seltxt_common"]
    if {$do_align} {
        $target move [::measure fit $target $ref]
    }
    set output [::measure rmsd $target $ref]
    $target delete
    $ref delete
    puts "=============================="
    puts "Atoms chosen:"
    puts "------------------------------"
    puts $seltxt_common
    return $output
}
