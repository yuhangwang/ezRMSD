outputs {
    prefix output/out2
    calc {
        overall {dat}
        res {dat txt}
        avg {dat txt}
    }
}

inputs {
    ref {
        input/p5.pdb
    }
    target {
        input/p6.pdb
    }
}

selections {
    ref {
        align all
        rmsd  all
    }
    target {
        align all
        rmsd  all
    }
}

control {
    align true
    save-pdb false
    save-selection-align true
    save-selection-rmsd true
}
