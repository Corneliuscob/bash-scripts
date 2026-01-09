#!/bin/bash


cd 
wget https://raw.githubusercontent.com/Corneliuscob/tmux-config/refs/heads/master/tmux/tmux.conf
mkdir ~/.tmux
cd .tmux
wget https://github.com/Corneliuscob/tmux-config/blob/master/tmux/tmux.remote.conf
cd 
mv tmux.conf .tmux.conf

mv ./bash-scripts/.vimrc ./


sudo apt-get install vim-gui-common -y 
sudo apt-get install vim-runtime -y




