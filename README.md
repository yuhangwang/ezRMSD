# ezRMSD
Align and compute the RMSD between two structures with different/same number of residues.


## Download
The latest release can be downloaded from [here](https://github.com/yuhangwang/ezRMSD/releases/download/0.1.0/ez-rmsd-0.1.0.zip).


## Installation on Windows 10
1. download the released version (zip file) from [here](https://github.com/yuhangwang/ezRMSD/releases/download/0.1.0/ez-rmsd-0.1.0.zip).
2. extract the content of zip file.
3. put the `ez-rmsd` folder and `load-rmsd-app.tcl` to this folder `C:/Program Files (x86)/University of Illinois/VMD/Mytclscripts`
4. add the following lines in your `C:/Program Files (x86)/University of Illinois/VMD/vmd.rc` file.
    ```
    # ez-rmsd
    ::tcl::tm::path add [file join "C:/Program Files (x86)/University of Illinois/VMD/Mytclscripts" "ez-rmsd"]
    package require rmsd
    package require fmap
    ```
 

## Feature
automatically find the common atoms between two structures

## Usage
* unzip the released zip file
* prepare a configuration file for your RMSD calculation (see [examples](https://github.com/yuhangwang/ezRMSD/tree/master/example))
* open `VMD` TK Console and type the followings.
    ```
    source load-rmsd-app.tcl
    ::rmsd::run example-config.tcl
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
- In the `outputs` `pdb` section, the first output is for the 
  `reference` structure and the second for the `target` structure 
   aligned to the reference. 
