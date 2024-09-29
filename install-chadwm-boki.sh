#!/usr/bin/env bash

installed_dir=$(dirname $(readlink -f $(basename `pwd`)))

sudo cp setup/usr-share/xsessions/* /usr/share/xsessions

sudo cp setup/usr-bin/* /usr/bin

# [ -d $HOME"/.config/chadwm-boki/sxhkd" ] || mkdir -p $HOME"/.config/chadwm-boki/sxhkd"

[ -d $HOME"/DATA" ] || mkdir -p $HOME"/DATA"
cd ~/DATA


cd $$installed_dir



