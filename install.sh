#!/bin/bash

echo "Updating repos"
sudo apt-get update

echo "Installing useful tools"
sudo apt-get install -y --no-install-recommends \
    jq \
    locales \
    zsh

echo "Setting locale"

sudo locale-gen "en_GB.UTF-8" \
&& LANG="en_GB.UTF-8" \
&& sudo dpkg-reconfigure --frontend noninteractive locales

echo "Installing and customizing oh-my-zsh"
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh || true

echo "Installing autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Installing my own themes"
git clone https://github.com/paulriley/zsh-themes.git /tmp/zsh-themes/ \
&& cp /tmp/zsh-themes/*.zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes \
&& rm -rf zsh-themes

echo "Customizing oh-my-zsh"
cp .zshrc ~/.zshrc
