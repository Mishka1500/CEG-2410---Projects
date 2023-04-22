#!/bin/bash

# Function to install packages
install_packages() {
        if [[ $EUID -ne 0 ]]; then
                echo "This script must be run as root"
                exit 1
        fi

       # Install packages silently
       apt-get update
       apt-get install -y git vim python3 sysstat > /dev/null 2>&1
}

# Function to configure Vim
configure_vim() {
        # Download Vim colorscheme
        git clone https://github.com/bluz71/vim-nightfly-colors.git ~/.vim/pack/plugins/start/nightfly > /dev/null 2>&1

        # Configure `.vimrc` to auto use colorscheme
        echo "syntax on" >> ~/.vimrc
        echo "colorscheme nightfly" >> ~/.vimrc

        # Install Vim plugins
        git clone https://github.com/scrooloose/nerdtree.git ~/.vim/pack/plugins/start/nerdtree > /dev/null 2>&1
        git clone https://github.com/tpope/vim-fugitive.git ~/.vim/pack/plugins/start/vim-fugitive > /dev/null 2>&1
}

# Function to download authorized_keys file
download_authorized_keys() {
        # Download authorized_keys file from Github repo
        curl -o ~/.ssh/authorized_keys https://raw.githubusercontent.com/WSU-kduncan/ceg2410-projects-Mishka1500/main/In%20Class%20Work/Script%20Assignment/authorized_keys?token=GHSAT0AAAAAAB76EILEWINU2PNUCUAXGGECZB7JCRA > /dev/null 2>&1
        chmod 700 .ssh
}

# Function that calls all other functions
main() {
        install_packages
        configure_vim
        download_authorized_keys
}

# Call the main function
main

echo "Installation complete."