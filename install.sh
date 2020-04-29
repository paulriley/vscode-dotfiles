#!/bin/bash
echo "Installing oh-my-zsh"
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh || true
echo "Customizing oh-my-zsh"
cp .zshrc ~/.zshrc
