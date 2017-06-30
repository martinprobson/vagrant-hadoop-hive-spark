#!/bin/bash

source "/vagrant/scripts/common.sh"

function setupUtilities {
    # update the locate database
    updatedb
}

function setupVIM {
    # Use the full vim version plus some vim customizations.
    apt-get remove -y vim.tiny
    apt-get install -y vim
    tar xf $VIM_RES_DIR/vim.tar
    cp -R $VIM_RES_DIR/.vim /home/ubuntu/.
    cp $VIM_RES_DIR/vimrc /home/ubuntu/.vimrc
    # Set bash vim mode
    echo "set -o vi" >> /home/ubuntu/.bashrc

}

echo "finalize ubuntu"
setupUtilities
echo "setup vim"
setupVIM
