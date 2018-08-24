# ezRMSD
Align and compute the RMSD between two structures with different/same number of residues.


## Download
The latest release can be downloaded from [here](https://github.com/yuhangwang/ezRMSD/releases/download/0.1.0/rmsd-app-0.1.0.zip).

## Feature
automatically find the common atoms between two structures

## Usage
* unzip the released zip file
* prepare a configuration file for your RMSD calculation (see [examples](https://github.com/yuhangwang/ezRMSD/tree/master/example))
* open `VMD` TK Console and type the followings.
    ```
    source load-rmsd-app.tcl
    ::rmsd::run config.tcl
    ```
    Note: you need to keep `load-rmsd-app.tcl` and the folder `rmsd-app` in the same directory.

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
