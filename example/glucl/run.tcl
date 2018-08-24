outputs {
    prefix output/CA/rmsd
    calc {
        overall {dat}
        res {dat txt}
        avg {dat txt}
    }
    pdb {
        {
            name output/CA/4tnv_aligned.pdb
            selection all
        }
        {
            name output/CA/3rif_aligned.pdb
            selection all 
        }
    }
}

inputs {
    ref {
        pdb/4tnv_clean.pdb
    }
    target {
        pdb/3rif_clean.pdb
    }
}

selections {
    align {
        ref     "(resid 1 to 212) and (name CA)"
        target  "(resid 1 to 212) and (name CA)"
    }
    rmsd {
        ref     "(resid 1 to 212) and (name CA)"
        target  "(resid 1 to 212) and (name CA)"
    }
}

control {
    align true
    save-pdb true
    save-selection-align true
    save-selection-rmsd true
}
