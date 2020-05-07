#!/bin/bash

echo "Installing and customizing oh-my-zsh"
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh || true

echo "Installing my own themes"
git clone https://github.com/paulriley/zsh-themes.git /tmp/zsh-themes/ \
&& cp /tmp/zsh-themes/*.zsh-theme ~/.oh-my-zsh/themes \
&& rm -rf zsh-themes

echo "Customizing oh-my-zsh"
cp .zshrc ~/.zshrc
