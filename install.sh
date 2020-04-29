#!/bin/bash
echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Customizing oh-my-zsh"
cp .zshrc ~/.zshrc
