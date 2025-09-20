#!/usr/bin/env bash

sudo pacman -S --needed --noconfirm \
base-devel \
libx11 \
libxft \
libxinerama \
freetype2 \
fontconfig \
ttf-meslo-nerd \
ttf-jetbrains-mono-nerd \
terminus-font-ttf \
terminus-font \
kitty \
alacritty \
git \
curl \
wget \
make \
cmake \


installed_dir=$(dirname $(readlink -f $(basename `pwd`)))

sudo cp setup/usr-share/xsessions/* /usr/share/xsessions

sudo cp setup/usr-bin/* /usr/bin

# [ -d $HOME"/.config/chadwm-boki/sxhkd" ] || mkdir -p $HOME"/.config/chadwm-boki/sxhkd"

# [ -d $HOME"/DATA" ] || mkdir -p $HOME"/DATA"
# cd ~/DATA


# cd $$installed_dir



