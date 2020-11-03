#!/bin/bash

source "./utils.sh"

function prepare_installation {
    if [[ $OSTYPE == "linux-gnu"* ]]; then
        apt-get -y update >>install.out 2>&1
        apt-get -y upgrade >>install.out 2>&1
        apt-get -y install git >>install.out 2>&1
    fi
}

function install_zsh {
    if [[ "$(uname)" == "Darwin" ]]; then
        if [[ "$(get_shell)" != "/bin/zsh" ]]; then
            brew install zsh >>install.out 2>&1
        fi
        if [[ $(get_shell) != "/bin/zsh" ]]; then
            chsh -s "$(which zsh)" >>install.out 2>&1
        fi
    elif [[ $OSTYPE == "linux-gnu"* ]]; then
        if [[ "$(get_shell)" != "/bin/zsh" ]]; then
            apt-get -y install zsh >>install.out 2>&1
        fi
        sed -i "s|/bin/bash|$(which zsh)|g" /etc/passwd
    fi
}

function install_curl {
    if [[ $OSTYPE == "linux-gnu"* && -z $(which curl) ]]; then
        apt-get -y install curl >>install.out 2>&1
    fi
}

function install_golang {
    if [ ! -d "$HOME/.go" ]; then
        curl -s https://raw.githubusercontent.com/tanvirtin/golanginstall/master/goinstall.sh | bash >>install.out 2>&1
    fi
}

function install_vim {
    if [[ -z $(which vim) ]]; then
        if [[ $OSTYPE == "linux-gnu"* ]]; then
            apt-get -y install vim >>install.out 2>&1
        elif [[ "$(uname)" == "Darwin" ]]; then
            brew install vim >>install.out 2>&1
        fi
    fi
}

function install_nvim {
    if [[ $OSTYPE == "linux-gnu"* ]]; then
        DEBIAN_FRONTEND=noninteractive apt-get -y install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip >>install.out 2>&1
        (
            cd "$HOME"
            rm -rf neovim
            git clone https://github.com/neovim/neovim >>install.out 2>&1
            cd neovim
            make CMAKE_BUILD_TYPE=Release install >>install.out 2>&1
            cd "$HOME"
            rm -rf neovim
        )
    elif [[ "$(uname)" == "Darwin" ]]; then
        brew install ninja libtool automake cmake pkg-config gettext >>install.out 2>&1
        (
            cd "$HOME"
            rm -rf neovim
            git clone https://github.com/neovim/neovim >>install.out 2>&1
            cd neovim
            make CMAKE_BUILD_TYPE=Release install >>install.out 2>&1
            cd "$HOME"
            rm -rf neovim
        )
    fi
}

function install_tmux {
    if [[ -z $(which tmux) ]]; then
        if [[ $OSTYPE == "linux-gnu"* ]]; then
            apt-get -y install tmux >>install.out 2>&1
        elif [[ "$(uname)" == "Darwin" ]]; then
            brew install tmux >>install.out 2>&1
        fi
    fi
}

function install_starship {
    if [[ $OSTYPE == "linux-gnu"* ]]; then
        sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes >>install.out 2>&1
    elif [[ "$(uname)" == "Darwin" ]]; then
        brew install starship >>install.out 2>&1
    fi
}

function install_ripgrep {
    if [[ $OSTYPE == "linux-gnu"* ]]; then
        apt-get -y install ripgrep >>install.out 2>&1
    elif [[ "$(uname)" == "Darwin" ]]; then
        brew install ripgrep >>install.out 2>&1
    fi
}

function main {
    echo -n "" > install.out
    run_task prepare_installation "Preparing installation"
    if [[ $1 == "zsh" ]]; then
        run_task install_zsh "installing zsh"
    elif [[ $1 == "curl" ]]; then
        run_task install_curl "installing curl"
    elif [[ $1 == "golang" ]]; then
        run_task install_golang "installing golang"
    elif [[ $1 == "vim" ]]; then
        run_task install_vim "installing vim"
    elif [[ $1 == "nvim" ]]; then
        run_task install_nvim "installing nvim"
    elif [[ $1 == "tmux" ]]; then
        run_task install_tmux "installing tmux"
    elif [[ $1 == "starship" ]]; then
        run_task install_starship "installing starship"
    elif [[ $1 == "ripgrep" ]]; then
        run_task install_ripgrep "installing ripgrep"
    else
        run_task install_zsh "installing zsh"
        run_task install_curl "installing curl"
        run_task install_golang "installing golang"
        run_task install_vim "installing vim"
        run_task install_nvim "installing nvim"
        run_task install_tmux "installing tmux"
        run_task install_starship "installing starship"
        run_task install_ripgrep "installing ripgrep"
    fi
    echo "DONE"
}

main $1
