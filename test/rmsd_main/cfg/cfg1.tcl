outputs {
    prefix output/out1
    calc {
        overall {dat}
        res {dat txt}
        avg {dat txt}
    }
    pdb {
        {
            name output/out1_ref_aligned.pdb
            selection all
        }
        
        {
            name output/out1_target_aligned.pdb
            selection all
        }
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
    align {
        ref    all
        target all
    }
    rmsd {
        ref    all
        target all
    }
}

control {
    align true
    save-pdb true
    save-selection-align false
    save-selection-rmsd false
}
