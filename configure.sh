#!/bin/bash

source "./utils.sh"

function configure_scripts {
    cp -a "$DOTFILES_DIR/scripts/." "$HOME/tinscripts"
}

function configure_shell {
    if [[ $(get_shell) != "/bin/zsh" ]]; then
        chsh -s "$(which zsh)" >>configure.out 2>&1
    fi
}

function configure_zshrc {
    cp "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc" >>configure.out 2>&1
    if [[ ! -d "$HOME/.zsh/zsh-autosuggestions" ]]; then
        git clone "https://github.com/zsh-users/zsh-autosuggestions" "$HOME/.zsh/zsh-autosuggestions" >>configure.out 2>&1
    fi
}

function configure_nvm {
    curl -s -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash >>configure.out 2>&1
}

function configure_node {
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
    nvm install node >>configure.out 2>&1
    nvm use node >>configure.out 2>&1
}

function configure_nvim {
    git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim >>configure.out 2>&1
    rm -rf "$HOME/.config/nvim"
    cp -r "./nvim" "$HOME/.config/"
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        npm install -g tree-sitter-cli >>configure.out 2>&1
    fi
}

function configure_tmux {
    cp .tmux.conf "$HOME/.tmux.conf"
}

function configure_kitty {
    if [[ ! -d "$HOME/.config/kitty" ]]; then
        mkdir "$HOME/.config/kitty"
    fi
    cp kitty.conf "$HOME/.config/kitty/kitty.conf"
}

function configure_rust {
    curl https://sh.rustup.rs -sSf | sh -s -- -y >>configure.out 2>&1
}

function configure_fzf {
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf >>configure.out 2>&1
    echo y | ~/.fzf/install >>configure.out 2>&1
}

function start_zsh {
    exec "$(which zsh)" -l
}

function main {
    echo -n "" > configure.out
    if [[ $1 == "nvim" ]]; then
        run_task configure_nvim "configure_nvim"
    elif [[ $1 == "zsh" ]]; then
        run_task configure_zshrc "configuring zshrc"
    elif [[ $1 == "scripts" ]]; then
        run_task configure_scripts "configuring scripts"
    elif [[ $1 == "nvim" ]]; then
        run_task configure_nvim "configuring nvim"
    elif [[ $1 == "node" ]]; then
        run_task configure_node "configuring node"
    elif [[ $1 == "tmux" ]]; then
        run_task configure_tmux "configuring tmux"
    elif [[ $1 == "kitty" ]]; then
        run_task configure_kitty "configuring kitty"
    elif [[ $1 == "rust" ]]; then
        run_task configure_rust "configuring rust"
    elif [[ $1 == "fzf" ]]; then
        run_task configure_fzf "configuring fzf"
    else
        run_task configure_zshrc "configuring zshrc"
        run_task configure_scripts "configuring scripts"
        run_task configure_nvm "configuring nvm"
        run_task configure_node "configuring node"
        run_task configure_nvim "configuring nvim"
        run_task configure_tmux "configuring tmux"
        run_task configure_kitty "configuring kitty"
        run_task configure_rust "configuring rust"
        run_task configure_fzf "configuring fzf"
    fi
    echo "DONE"
    start_zsh
}

main $1
