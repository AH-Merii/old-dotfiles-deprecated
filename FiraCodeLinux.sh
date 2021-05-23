# download firacode nerdfonts 
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
# unzip directory and move to windows fonts directory if running on wsl
unzip FiraCode.zip -d FiraCode
mv FiraCode/Fira?*Complete.otf 
rm -rf FiraCode*