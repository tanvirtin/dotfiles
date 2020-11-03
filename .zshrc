#!/bin/zsh

WORKSPACE_PATH="$HOME/workspace"
PROFILE_PATH="$HOME/.zshrc"

export WORKSPACE_PATH
export PROFILE_PATH

function configure_starship {
    eval "$(starship init zsh)"
}

function configure_aliases {
    alias v="nvim"
    alias vi="nvim"
    alias vim="nvim"
    alias c="clear"
}

function configure_rust {
    if [[ -d "$HOME/.cargo/env" ]]; then
        source "$HOME/.cargo/env"
    fi
}

function configure_golang {
    if [[ -d "$HOME/.go" ]]; then
        export GOROOT="$HOME/.go"
        export PATH="$GOROOT/bin:$PATH"
        export GOPATH="$HOME/go"
        export PATH="$GOPATH/bin:$PATH"
    fi
}

function configure_nvm {
    NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "$HOME/.nvm" || printf %s "$XDG_CONFIG_HOME/nvm")"
    export NVM_DIR
    [[ -s "$NVM_DIR/nvm.sh" ]] && \. "$NVM_DIR/nvm.sh"
}

function configure_shortcuts {
    if [[ -e "$HOME/tinscripts/shortcuts.sh" ]]; then
        source "$HOME/tinscripts/shortcuts.sh"
    fi
}

function configure_zsh_autosuggestions {
    if [[ -e "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
        source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
    fi
}

function main {
    configure_starship
    configure_aliases
    configure_nvm
    configure_golang
    configure_rust
    configure_shortcuts
    configure_zsh_autosuggestions
}

main
