#!/bin/bash

ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.bashrc ~/.bashrc

echo "Installing vim plugins..."
vim +Pluginstall

echo "Complete."
