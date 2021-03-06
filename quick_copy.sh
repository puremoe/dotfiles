#!/bin/sh

cp -r "$HOME/.config/themes"        "./config/"
# cp -r "$HOME/.config/alacritty"     "./config/"
cp -r "$HOME/.config/foot"          "./config/"
# cp -r "$HOME/.config/zsh"           "./config/"
cp    "$HOME/.config/nvim/init.vim" "./config/nvim/"
cp -r "$HOME/.config/sway"          "./config/"
cp -r "$HOME/.config/waybar"        "./config/"
cp -r "$HOME/.config/wofi"          "./config/"
cp -r "$HOME/.config/mako"          "./config/"
cp $HOME/.local/bin/dmenu*          "./local/bin/"
cp $HOME/.local/bin/sway*           "./local/bin/"

