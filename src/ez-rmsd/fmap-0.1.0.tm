## Apply a function to a list
namespace eval ::_ {}
proc ::_::fmap {f xs args} {
    set output {}
    foreach x $xs {
        # note: `split` takes care of functions with spaces
        # e.g. `string map`
        lappend output [{*}[split $f] $x {*}$args]
    }
    return $output
}
