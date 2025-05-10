# 1. Update & Upgrade system
apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y && apt-get clean

apt-get install -y wget
# 2. Install zsh
apt-get install -y zsh

apt-get install -y curl

# 3. Install starship
curl -sS https://starship.rs/install.sh | sh -s -- -y  #表示將 -y 傳給 install.sh 腳本作為參數，略過互動詢問

# 5. Install tmux
apt-get install -y tmux

apt-get install -y zip

# 4. Install nvim
#apt-get install -y neovim
cd ..
wget https://github.com/neovim/neovim/releases/download/v0.11.1/nvim-linux-x86_64.tar.gz
tar xzvf nvim-linux-x86_64.tar.gz
bash ./nvim-linux-x86_64/bin/nvim
rm -rf nvim-linux-x86_64.tar.gz

# 6. Install font
mkdir -p ~/fonts_download
cd ~/fonts_download
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Tinos.zip
unzip Tinos.zip
cd ..
mkdir -p ~/.fonts
cp ~/fonts_download/*.ttf ~/.fonts/
fc-cache -fv
re -rf fonts_download

# 7. Install stow
apt-get install -y stow

cd dotfiles

# 8. Clone this repo (請視情況執行)
# git clone https://github.com/yaocongchen/dotfiles.git

# 9. Enter the dotfiles folder (請視情況執行)
# cd dotfiles

# 10. stow inter folder
chsh -s $(which zsh)

source ~/.zshrc

stow zsh starship nvim tmux