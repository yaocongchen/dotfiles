# 1. Update & Upgrade system
apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y && apt-get clean

apt-get install -y wget
# 2. Install zsh
apt-get install -y zsh

# 3. Install starship
apt-get install -y starship

# 4. Install nvim
#apt-get install -y neovim
cd ..
wget https://github.com/neovim/neovim/releases/download/v0.11.1/nvim-linux-x86_64.tar.gz
tar xzvf nvim-linux-x86_64.tar.gz
bash ./nvim-linux-x86_64/bin/nvim
cd dotfiles

# 5. Install tmux
apt-get install -y tmux

# 6. Install font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Tinos.zip
apt-get install -y zip
unzip Tinos.zip
mkdir -p ~/.fonts
cp ~/Tinos/*.ttf ~/.fonts/
fc-cache -fv

# 7. Install stow
apt-get install -y stow

# 8. Clone this repo (請視情況執行)
# git clone https://github.com/yaocongchen/dotfiles.git

# 9. Enter the dotfiles folder (請視情況執行)
# cd dotfiles

# 10. stow inter folder
stow zsh starship nvim tmux