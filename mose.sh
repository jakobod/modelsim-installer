#!/bin/bash

VPN=/opt/cisco/anyconnect/bin/vpn
HOST=connect.haw-hamburg.de
MOSE_FOLDER=$HOME/.MentorGraphics/modeltech/linux_x86_64/

#export needed things
export PATH="$PATH:$MOSE_FOLDER"
export LM_LICENSE_FILE="1717@b-gates.etech.haw-hamburg.de"

# connect to HAW-vpn
echo please enter your user-name [abc123]
read USER

echo please enter your password
read -s PASSWORD
echo

printf "$USER\n$PASSWORD" | $VPN -s connect $HOST &>/dev/null
$VPN status

$MOSE_FOLDER/vsim && $VPN disconnect

