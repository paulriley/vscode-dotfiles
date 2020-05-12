#!/bin/bash

echo "Installing jq and zsh"
sudo apt-get update
sudo apt-get install \
    jq \
    zsh

echo "Installing and customizing oh-my-zsh"
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh || true

echo "Installing autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Installing my own themes"
git clone https://github.com/paulriley/zsh-themes.git /tmp/zsh-themes/ \
&& cp /tmp/zsh-themes/*.zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/custom/themes \
&& rm -rf zsh-themes

echo "Customizing oh-my-zsh"
cp .zshrc ~/.zshrc
