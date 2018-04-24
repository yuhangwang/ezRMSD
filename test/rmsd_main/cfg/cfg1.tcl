outputs {
    prefix output/out1
    calc {
        overall {dat}
        res {dat txt}
        avg {dat txt}
    }
    pdb {
        output/out1_ref_aligned.pdb
        output/out1_target_aligned.pdb
    }
}

inputs {
    ref {
        input/p3.pdb
    }
    target {
        input/p4.pdb
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
    save-pdb true
    save-selection-align false
    save-selection-rmsd false
}
