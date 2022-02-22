# download firacode nerdfonts 
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
# unzip directory and move to windows fonts directory if running on wsl
unzip FiraCode.zip -d FiraCode
[ -n "$IS_WSL" ] || [ -n "$WSL_DISTRO_NAME" ] && \
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip  && \
sudo mv FiraCode/Fira?*Complete.otf /usr/share/fonts/opentype/ && rm -rf FiraCode* ||\ # else install firacode for linux
sudo apt update && sudo apt install fonts-firacode
