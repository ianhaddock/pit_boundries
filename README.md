# Simview Cache Tool
This batch script simplifies generating pit boundary files and car badge files used by the [Simview][1] plugin for Assetto Corsa. These files replace the need to upload large KN5 track files and entire car folders.  

The script scans the Steam install location for Assetto Corsa by default or you can pass a path to it. This is useful if you have a large tracks folder and SimViewTool.exe runs out of memory parsing it, or you want to scan just the subset of tracks and cars used on your server. 

The path submitted should end with 'assettocorsa' and contain '/content/tracks' and '/content/cars' subfolders. See usage below.

This script is provided AS IS with no warranty expressed or implied. Use at your own risk.

### Requirements
* Windows machine with a local installation of Assetto Corsa.
* SimViewTool.exe placed in the same location as the script, which can be [downloaded here][1].

### How to run
* Download a copy of this repo.
* Download [Simview][1] and extract the SimViewTool.exe into the same location as the batch script.
* Double click to start or open a cmd window and run it.

### What will happen
* SimViewTool.exe will generate pit boundary files. Press enter when it finishes to continue.
* Those pit boundary files (*.pb) will be moved to simview_cache/tracks.
* Car badge.png image files will be copied to simview_cache/cars and formatted for simview. 

When complete you will see: 

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

### How to install
* Move the simview_cache content to your server's simview cache directory
* Update file permissions as needed

Simview will immediately start using the files, no restart required.

### Usage
```
> .\simview_cache_tool.bat

This script will build a simview_cache folder with:
   (1) SimViewTool.exe generated pit boundary files
   (2) simview formatted car badge image files

You can optionally pass a path to the script when run:
 .\generate_simview_files.bat "D:\path\to\assettocorsa"
NOTE: do not include the trailing slash in custom paths.

Path selected: C:\PROGRA~2\Steam\steamapps\common\assettocorsa

Proceed (Y/[N])?
```

### Notes

The SimViewTool.exe tool may crash when parsing tracks. When this happens the script will immediately move on to creating badge images without requiring you to press enter. To get around this look in the simview_cache/tracks directory and find the last completed track .pb file. In your Assetto Corsa tracks directory remove the track after the last .pb file created and re-run the script. 

Tracks that fail for me:
* jr_road_atlanta_2022

[1]:https://www.racedepartment.com/downloads/simview.35249/
