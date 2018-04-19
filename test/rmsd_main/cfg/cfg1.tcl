{
    outputs {
        prefix output/out1
        calc {
            overall {dat}
            res {dat txt}
            res-by-chain {dat txt}
            res-by-chain-avg {dat txt}
        }
        save-rmsd-pdb true
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
}
