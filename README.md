# modelsim-installer
this is a repo containing all necessary files to automatically install the linux version of modelsim. For convenience I've added a modelsim startscript which will start a VPN connection to the HAW-servers before starting modelsim. All needed systemvariables are set by this script.

# HOW-TO
```
git clone https://github.com/jakobod/modelsim-installer
cd modelsim-installer
chmod +x install.sh
./install.sh
```
*IMPORTANT*
The modelsim installer is a GUI. I haven't been able to find a way to set the install-directory from the script.
You will have to set the install-dir manually into *THIS* folder. The script tells you the path while performing the installation.

When the script has run through, you will be able to find a desctop entry for modelsim, which can just be clicked.

# Notes
This has only been tested on Fedora with gnome. Other Distros and desktop-environments will probably work, but may need some changes in the scripts.
