#! package require rmsd_io_read_cfg
#! package require rmsd_align
#! package require rmsd_calc_all
#! package require rmsd_calc_res
#! package require io_save_list
#! package require vmd_io_load
##=======================================================
## Calculate overall RMSD values
##=======================================================
## Args:
## ---
## cfg (dict): input configuration dictionary
##=======================================================
proc ::rmsd::main {cfg} {
    set id1 [::vmd::io load {*}[::dict get $cfg inputs ref]]
    set id2 [::vmd::io load {*}[::dict get $cfg inputs target]]
    set output_prefix  [::dict get $cfg outputs prefix]
    set seltxt1 [::dict get $cfg select1]
    set seltxt2 [::dict get $cfg select2]
    set common [::rmsd::common_part $id1 $seltxt1 $id2 $seltxt2]
    set seltxt_common [::rmsd::seltxt $common]

    if {[::dict get $cfg control align]} {
        ::rmsd::align $id1 $seltxt_common $id2 $seltxt_common
    }

    
    ::_::io::save_list $output $rmsd_values
    return $output
}
