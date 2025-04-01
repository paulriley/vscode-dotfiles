source ~/.antigen/antigen.zsh

path=('/home/paul/.local/bin' '/home/paul/bin' '/home/paul/.npm-global/bin' '/home/paul/.dotnet/tools' '/home/paul/.yarn/bin' '/home/paul/.config/yarn/global/node_modules/.bin' $path)

zstyle :omz:plugins:ssh-agent identities id_wsnh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundle zpm-zsh/autoenv
antigen bundle yarn
antigen bundle nvm
antigen bundle aws
antigen bundle git
antigen bundle gh
antigen bundle docker
antigen bundle docker-compose
antigen bundle dotnet
antigen bundle sudo
antigen bundle safe-paste
antigen bundle ssh-agent
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme paulriley/zsh-themes azure-devops

# Tell Antigen that you're done.
antigen apply

export EDITOR="code --wait"
export BROWSER="/mnt/c/Program\ Files/BraveSoftware/Brave-Browser/Application/brave.exe"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export SSL_CERT_DIR="$HOME/.aspnet/dev-certs/trust:/usr/lib/ssl/certs"

# pnpm
export PNPM_HOME="/home/paul/.local/share/pnpm"
path=($PNPM_HOME $path)
# pnpm end

# dotnet
export DOTNET_ROOT=$HOME/.dotnet
path=($DOTNET_ROOT $DOTNET_ROOT/tools $path)
# dotnet end

# az completion
autoload -Uz +X compinit && compinit
source '/home/paul/lib/azure-cli/az.completion'
# az completion end

# azd completion
if type azd > /dev/null 2>&1; then
    # Create temp file for completion script
    local azd_completion_file="${ZSH_CACHE_DIR:-$HOME/.cache/zsh}/azd_completion.zsh"
    
    # Generate completion script if it doesn't exist or is older than 24 hours
    if [[ ! -f "$azd_completion_file" || $(find "$azd_completion_file" -mtime +1 -print) ]]; then
        azd completion zsh >| "$azd_completion_file"
    fi
    
    source "$azd_completion_file"
    compdef _azd azd
fi
# azd completion end

path=($HOME/.console-ninja/.bin $path)
export PATH

