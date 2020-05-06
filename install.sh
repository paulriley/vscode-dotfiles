#!/bin/bash

echo "Installing and customizing oh-my-zsh"
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh || true

echo "Installing my own themes"
git clone https://github.com/paulriley/zsh-themes.git 
cp /tmp/zsh-themes/*.zsh-theme ~/.oh-my-zsh/themes
rm -rf zsh-themes

echo "Customizing oh-my-zsh"
cp .zshrc ~/.zshrc

echo "Copying some handy scripts over"
cp -r quick-scripts ~
export PATH=$PATH:~/quick-scripts
