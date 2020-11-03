#!/bin/bash

export DOTFILES_DIR

DOTFILES_DIR="./"

if [[ -d "$HOME/.dotfiles" ]]; then
    DOTFILES_DIR="$HOME/.dotfiles"
fi

function run_task {
    spin=("-" "\\" "|" "/")
    "$@" &
    pid=$!
    echo -n "[$2] ${spin[0]}"
    while true; do
        if ! ps -p $pid > /dev/null; then
            break
        fi
        for i in "${spin[@]}"; do
            echo -ne "\b$i"
            sleep 0.08
        done
    done
    wait $pid
    exit_code=$?
    echo -ne "\b- "
    log_result $exit_code
}

function log_result {
    if [[ $1 == 0 ]]; then
        echo DONE
    else
        echo FAILED
    fi
}

function get_shell {
    echo "$SHELL"
}

export DOTFILES_DIR
