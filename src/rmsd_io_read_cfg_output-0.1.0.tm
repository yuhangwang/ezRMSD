## ===============================================
## Read a config file and return a dictionary
## related to the output parameters
## ===============================================
## Args:
## cfg (dict): config dictionary
## ===============================================
## Returns: output config dict
## ===============================================
proc ::rmsd::io::read::cfg::output {cfg} {
    set params [::dict create]
    if {[::dict exists $cfg output-prefix]} {
        ::dict set params prefix [::dict get $cfg output-prefix]
    } else {
        ::dict set params prefix "rmsd-output"
    }

    set rmsd_styles {}
    foreach key in [::dict keys $cfg] {
        set val [::dict get $cfg $key]
        if {$key eq "rmsd-overall"} {
            ::dict set params prefix $val
        } elseif {$key eq "output-overall"} {
            lappend rmsd_styles
        }
    }
}