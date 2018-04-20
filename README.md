# ezRMSD
Align and compute the RMSD between two structures with different/same number of residues.


## Feature
automatically find the common atoms between two structures

## Usage
```
package require rmsd
::rmsd::run config.txt
```

## Example 
Example configuration file:
```tcl
{
    outputs {
        prefix output/out1
        calc {
            overall {dat}
            res {dat txt pdb}
            avg {dat txt pdb}
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
    }
}
```
