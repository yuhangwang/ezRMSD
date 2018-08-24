# ezRMSD
Align and compute the RMSD between two structures with different/same number of residues.


## Feature
automatically find the common atoms between two structures

## Usage
```
source load-rmsd-app.tcl
::rmsd::run config.tcl
```

## Example 
Example configuration file:
```tcl
outputs {
    prefix output/out1
    calc {
        overall {dat}
        res {dat txt}
        avg {dat txt}
    }
    pdb {
        {
            name output/ref_aligned.pdb
            selection all
        }
        {
            name output/target_aligned.pdb
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
        ref    "chain A"
        target "chain A"
    }
    rmsd {
        ref    "protein and noh"
        target "protein and noh"
    }
}

control {
    align true
    save-pdb true
    save-selection-align true
    save-selection-rmsd true
}
```

- `dat` means outputting data values.  
- `txt` means outputting the common residues selected
   Look for *_sel-align.txt, *_sel-align.str.txt, *sel-rmsd.str.txt  
   and *sel-rmsd.txt files.
