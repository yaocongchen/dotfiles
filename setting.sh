# 1. Update & Upgrade system
sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade -y && sudo apt-get clean

# 2. Install zsh
sudo apt-get install -y zsh

# 3. Install starship
sudo apt-get install -y starship

# 4. Install font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Tinos.zip
sudo apt-get install -y zip
unzip Tinos.zip
mkdir -p ~/.fonts
cp ~/Tinos/*.ttf ~/.fonts/
fc-cache -fv

# 5. Install stow
sudo apt-get install -y stow

# 6. Clone this repo (請視情況執行)
# git clone https://github.com/yaocongchen/dotfiles.git

# 7. Enter the dotfiles folder (請視情況執行)
# cd dotfiles

# 8. stow inter folder
stow zsh starship nvim tmux