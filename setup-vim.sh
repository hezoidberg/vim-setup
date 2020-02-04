#! /usr/bin/env bash

copy_vim_config() {
    if [[ -f "$HOME/.vimrc" ]]; then
        if grep -q 'set number' "$HOME/.vimrc"; then
            echo '.vimrc already configured'
        else
            cat .vimrc >> "$HOME/.vimrc"
        fi
    else
        cp .vimrc "$HOME"
    fi
}

PLUGINS=(
'https://github.com/jiangmiao/auto-pairs.git'
'https://github.com/ctrlpvim/ctrlp.vim.git'
'https://github.com/junegunn/fzf.vim.git'
'https://github.com/scrooloose/nerdtree.git'
'https://github.com/vim-airline/vim-airline.git'
'https://github.com/vim-airline/vim-airline-themes.git'
'https://github.com/tpope/vim-fugitive.git'
'https://github.com/tpope/vim-rails.git'
'https://github.com/vim-ruby/vim-ruby.git'
'https://github.com/pangloss/vim-javascript.git'
)

install_plugins() {
    PLUGINS_DIR="$HOME/.vim/pack/plugins/start/"

    if [[ ! -d "$PLUGINS_DIR" ]]; then
        mkdir -p "$PLUGINS_DIR"
    fi

    cd "$PLUGINS_DIR"
    for plugin in "${PLUGINS[@]}"
    do
        echo "cloning --> $plugin"
        plugin_name_git=$(echo $plugin | grep -oP "[^\/]+$")
        plugin_name="${plugin_name_git%????}"
        if [[ ! -d "$plugin_name" ]]; then
            git clone "$plugin"
        else
            cd "$plugin_name"
            git pull
            cd ..
        fi
    done
}

copy_vim_config
install_plugins
