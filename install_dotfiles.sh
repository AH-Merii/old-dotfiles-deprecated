#!/bin/sh

path=$(pwd)

create_update_dotconfig() {
    ([ -d $1 ] && rm -rf $1) ||([ -f $1 ] && rm $1) ; ln -s $2 $1
}

# Home directory
create_update_dotconfig $HOME/.bash_profile $path/.bash_profile 
create_update_dotconfig $HOME/.bashrc $path/.bashrc 
create_update_dotconfig $HOME/.gitconfig $path/.gitconfig 
create_update_dotconfig $HOME/.profile $path/.profile 
create_update_dotconfig $HOME/.zcompdump $path/.zcompdump 
create_update_dotconfig $HOME/.zprofile $path/.zprofile 
create_update_dotconfig $HOME/.zshenv $path/.zshenv 
create_update_dotconfig $HOME/.zshrc $path/.zshrc 

# Config directory
create_update_dotconfig $HOME/.config $path/config

# Local directory
create_update_dotconfig $HOME/.local $path/.local

# # check if running wsl 
# # [ -d /mnt/c ] && 