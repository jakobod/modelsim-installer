#!/bin/bash
# install.sh - this script installs all necessary things for 
#              the linux version of modelsim

ROOT_DIR=$(pwd)
VPN=/opt/cisco/anyconnect/bin/vpn

make_desktop_entry() {
  FILE=mose.desktop
  echo [Desktop Entry] > $FILE
  echo Encoding=UTF-8 >> $FILE
  echo Name=Modelsim >> $FILE
  echo Comment=Launch Modelsim with VPN activated >> $FILE
  echo "Exec=gnome-terminal -e $HOME/.MentorGraphics/modeltech/linux_x86_64/mose.sh" >> $FILE
  echo Icon=utilities-terminal >> $FILE
  echo Type=Application >> $FILE
  echo X-Desktop-File-Install-Version=0.23 >> $FILE
  echo Icon=$HOME/.local/share/icons/modelsim.jpg >> $FILE
}

echo 'please enter your user-name [abc123]:'
read USER_NAME

# step one: download modelsim
if cd LINUX; then
  echo 'modelsim already downloaded. Skipping!'
else
  echo 'Downloading Modelsim Files now'
  sftp -r $USER_NAME@sftp.informatik.haw-hamburg.de:/home/prof/schafers/html/LOCAL/MOSE/ModelSim10x6e_download_from_MG/LINUX . 
fi

# step two: install vpn-agent 'anyconnect'
if $VPN --version > /dev/null; then
  echo 'anyconnect vpn-agent already installed. Skipping!'
else
  echo 'installing vpn-agent now. You will need to enter sudo-pwd!'
  sudo ./vpn/vpnsetup.sh
fi

# step three: install modelsim
echo 'IMPORTANT:'
echo "install this software to: $ROOT_DIR"
cd $ROOT_DIR/LINUX
chmod +x install.linux64
./install.linux64
# installation process runs in GUI
cd $HOME
mkdir .MentorGraphics
cd $ROOT_DIR
mv modeltech $HOME/.MentorGraphics

# step four: now put the desktop icon to the corresponding folder.
cp mose.sh $HOME/.MentorGraphics/modeltech/linux_x86_64/
cp modelsim.jpg ~/.local/share/icons/
# generate the .desktop file. This is necessary for calling the shellscript by clicking it
make_desktop_entry
mv mose.desktop $HOME/.local/share/applications
