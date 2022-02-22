#!/bin/sh

# checks if repo exists. if repo does not exist clones it else it pulls the most recent changes.
git_clone_pull_repo() {
    repo=$1 
    repo_name=$(echo $repo | sed -rn 's/git@.+\/(.+)\.git/\1/p')
    # handle empty input for directory
    [ -z "$2" ] && directory="./" || directory=$2
    # check if repo is already cloned or not; if exists then pull
    if cd "$directory/$repo_name"; then git pull; else git clone --depth=1 $repo "$directory/$repo_name"; fi
}

sudo apt update
sudo apt upgrade

# install packages 
yes Y | sudo apt install \
bat \
zsh \
unzip \
jq \
fontconfig \
cloc

# download and install lsd (LSDeluxe)
curl -Ls https://api.github.com/repos/Peltoche/lsd/releases/latest | grep -o https.*lsd_.*amd64.deb | wget -qi -
sudo dpkg -i lsd?*.deb
rm lsd?*.deb

# install powerlevel 10k theme
git_clone_pull_repo git@github.com:romkatv/powerlevel10k.git ~/themes

## install plugins and scripts
git_clone_pull_repo git@github.com:zsh-users/zsh-syntax-highlighting.git ~/plugins
git_clone_pull_repo git@github.com:Tarrasch/zsh-command-not-found.git ~/plugins
git_clone_pull_repo git@github.com:MichaelAquilina/zsh-you-should-use.git ~/plugins
git_clone_pull_repo git@github.com:zsh-users/zsh-autosuggestions.git ~/plugins

cd ~/dotfiles

# create a directory for bash/zsh scripts and themes
[ ! -d ~/plugins ] && mkdir ~/plugins # the use of the exclacamtion mark is not allowing the program to run need to figure out how to use the not operation!
[ ! -d ~/themes ] && mkdir ~/themes

# download and install FiraCode (need to manually install in windows)
sh install_firacode.sh

# change defualt shell to zsh
sudo chsh -s $(which zsh) $(whoami)

exec /bin/zsh

# installing miniconda
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
~/miniconda3/bin/conda init bash
~/miniconda3/bin/conda init zsh

# installing mamba
conda install mamba -n base -c conda-forge


