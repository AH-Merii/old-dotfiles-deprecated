#!/bin/sh

path=$(pwd)

create_update_dotconfig() {
    ([ -d $1 ] && rm -rf $1) || ([ -f $1 ] && rm $1) ; 
    # if third argument is not passed then symlink file else symlink directory
    [ ! -z $3 ] && ln -sf $2 $1 || ln -s $2 $1;
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
create_update_dotconfig $HOME/.p10k.zsh $path/.p10k.zsh
create_update_dotconfig $HOME/.zfunc $path/.zfunc DIR

# Config directory
create_update_dotconfig $HOME/.config $path/config

# # check if running wsl 
# # [ -d /mnt/c ] && 