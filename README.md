# Simview Cache Tool
This batch file simplifies generating pit boundary files and car badge files used by the [Simview][1] plugin for Assetto Corsa.

## Requirements
* Windows machine with a local installation of Assetto Corsa
* SimViewTool.exe placed in the same location as the script, which can be [downloaded here][1].

### How to run
* Download the batch file
* Download [Simview][1] and extract the SimViewTool.exe into the same location as the batch file.
* Run the batch file.
* Optionally: if you have Assetto Corsa installed in a non standard location, you can pass the script the path.
* NOTE: Do not include the trailing slash if providing a path to the script.

A simview_cache folder will be created using SimViewTool.exe to generate pit boundary files and the script will rename the car badge.png for use with simview.

## How to install on game server
* move created simview_cache content to your simview installation's cache directory
* update file permissions if needed

Simview should immediately start using the files, no restart required.


[1]:https://www.racedepartment.com/downloads/simview.35249/
