#!/bin/bash

sudo apt update
sudo apt upgrade

# install packages 
sudo apt install \
zsh \
unzip \
jq \
fontconfig \ 
make

# download and install lsd (LSDeluxe)
curl -Ls https://api.github.com/repos/Peltoche/lsd/releases/latest | grep -o https.*lsd_.*amd64.deb | wget -qi -
dpkg -i lsd?*.deb
rm lsd?*.deb

# change defualt shell to zsh
chsh -s /bin/zsh

source $HOME/.zshrc

# create a directory for bash/zsh scripts and themes
[! -d ~/plugins ] && mkdir ~/plugins
[! -d ~/themes ] && mkdir ~/themes

# install powerlevel 10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/themes

## install plugins and scripts
git clone --depth=1 git@github.com:zsh-users/zsh-syntax-highlighting.git ~/plugins/zsh-syntax-highlighting
git clone --depth=1 git@github.com:MichaelAquilina/zsh-you-should-use.git ~/plugins/zsh-you-should-use
git clone --depth=1 git@github.com:Tarrasch/zsh-command-not-found.git ~/plugins/zsh-command-not-found
git clone --depth=1 git@github.com:zsh-users/zsh-autosuggestions.git ~/plugins/zsh-autosuggestions

# installing miniconda
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
~/miniconda3/bin/conda init bash
~/miniconda3/bin/conda init zsh

# installing mamba
conda install mamba -n base -c conda-forge

