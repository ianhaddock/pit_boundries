# Simview Cache Tool
This batch file simplifies generating pit boundary files and car badge files used by the [Simview][1] plugin for Assetto Corsa. This is useful if you are running an Assetto Corsa game server and do not want to upload upload large KN5 track files or entire car folders just for Simview.  

This script is provided AS IS with no warrantee expressed or implied. Use at your own risk.

### Requirements
* Windows machine with a local installation of Assetto Corsa
* SimViewTool.exe placed in the same location as the script, which can be [downloaded here][1].

### How to run
* Download the batch file
* Download [Simview][1] and extract the SimViewTool.exe into the same location as the batch file.
* Run the batch file.

A simview_cache folder will be created, the SimViewTool.exe will generate pit boundary files, and the script will format car badge.png files for use with simview. When complete you will have: 

```
> tree /F 
Folder PATH listing
C:.
│   .gitignore
│   README.md
│   SimViewTool.exe
│   simview_cache_tool.bat
│   
└───simview_cache
    ├───cars
    │       badge_1971_pantera_group4.png
    │       badge_a3dr_honda_s800.png
    │       badge_a3dr_honda_s800_rsc.png
    │       badge_a3dr_lambo_diablo_se30_jota.png
    │      <snip>
    │       
    └───tracks
            pit_boundary_acf_portimao_.pb
            pit_boundary_acu_cota_2021_.pb
            pit_boundary_acu_hungaroring_.pb
            pit_boundary_acu_mexico_2021_.pb
            <snip>
```

Optionally: you can pass the script non standard Assetto Corsa installation paths in quotes. See usage.

### How to install files on game server 
* move created simview_cache content to your simview installation's cache directory
* update file permissions as needed

Simview will immediately start using the files, no restart required.

### Usage
```
> .\simview_cache_tool.bat

This script will build a simview_cache folder with:
   (1) SimViewTool.exe geneerated pit boundaries files
   (2) simview formatted car badge files.

You can optionally pass non standard install paths to the script:
 .\generate_simview_files.bat "D:\path\to\assettocorsa"
NOTE: do not include the trailing slash in custom paths.

Path selected: C:\PROGRA~2\Steam\steamapps\common\assettocorsa

Proceed (Y/[N])?
```

[1]:https://www.racedepartment.com/downloads/simview.35249/
