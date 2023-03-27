#!/bin/bash
set -euo pipefail

# Create .setup directory for temporary files
mkdir -p ~/.setup

# Update package list and install required packages
sudo apt-get update
sudo apt-get install -y zsh git curl wget build-essential libssl-dev jq locales zip docker.io

# Create .antigen directory and install antigen
mkdir -p ~/.antigen
curl -L git.io/antigen > ~/.antigen/antigen.zsh

# Ensure .zshrc exists
touch ~/.zshrc

# Install and configure zsh
sudo chsh -s $(which zsh) $(whoami)

# Configure .zshrc
{
  echo "source ~/.antigen/antigen.zsh"
  echo "antigen use oh-my-zsh"
  echo "antigen theme af-magic"
  echo "antigen bundle zsh-users/zsh-autosuggestions"
  echo "antigen bundle zsh-users/zsh-completions"
  echo "antigen bundle zsh-users/zsh-syntax-highlighting"
  echo "antigen apply"
  echo "# NVM configuration"
  echo "export NVM_DIR=\"\$HOME/.nvm\""
  echo "[ -s \"\$NVM_DIR/nvm.sh\" ] && . \"\$NVM_DIR/nvm.sh\"  # This loads nvm"
  echo "[ -s \"\$NVM_DIR/bash_completion\" ] && . \"\$NVM_DIR/bash_completion\"  # This loads nvm bash_completion"
  echo "# Docker configuration"
  echo "export DOCKER_HOST=tcp://localhost:2375"
  echo "export DOCKER_TLS_VERIFY=0"
  echo "# Minikube configuration"
  echo "export MINIKUBE_HOME=\$HOME"
  echo "export CHANGE_MINIKUBE_NONE_USER=true"
  echo "export KUBECONFIG=\$HOME/.kube/config"
} > ~/.zshrc

# Suppress "Last login" message
touch ~/.hushlogin

# Reload zsh configuration
zsh -i -c 'source ~/.zshrc'

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
source ~/.nvm/nvm.sh

# Install the latest stable version of Node.js and npm
nvm install node

# Install pnpm
npm install -g pnpm

# Install the AWS CLI v2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o ~/.setup/awscliv2.zip
unzip ~/.setup/awscliv2.zip -d ~/.setup
sudo ~/.setup/aws/install

# Install the gh CLI manually
curl -L https://github.com/cli/cli/releases/latest/download/gh_2.25.1_linux_amd64.deb -o ~/.setup/gh.deb
sudo dpkg -i ~/.setup/gh.deb

# Install Terraform
wget -P ~/.setup https://releases.hashicorp.com/terraform/1.4.2/terraform_1.4.2_linux_amd64.zip
unzip -d ~/.setup ~/.setup/terraform_1.4.2_linux_amd64.zip
sudo mv ~/.setup/terraform /usr/local/bin

# Set system locale to en_GB.UTF-8
sudo locale-gen en_GB.UTF-8
sudo update-locale LANG=en_GB.UTF-8

# Install Minikube CLI
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr
