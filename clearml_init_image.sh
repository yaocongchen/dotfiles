#!/usr/bin/env bash

apt-get update && apt-get install -y \
    build-essential \
    git \
    wget \
    curl \
    vim \
    htop \
    unzip \
    nvtop \
    tmux \
    tzdata \
    software-properties-common \
    gnupg \
    ca-certificates \
    zip \
    locales \
    g++ \
    zsh \
    neovim \
    fontconfig \
    stow \
    fzf

yes '' | add-apt-repository ppa:neovim-ppa/unstable
apt-get update && apt-get install -y neovim

# huggingface-cli login
pip install huggingface_hub
huggingface-cli login --token YOUR_HUGGINGFACE_TOKEN

echo 'export HF_HOME=/mnt/shared/cache_storage/huggingface' >> ~/.bashrc

# conda
conda init bash
source ~/.bashrc

# time zone
TZ=Asia/Taipei
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime
echo $TZ > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

# set locale
locale-gen en_US.UTF-8
export LANG=en_US.UTF-8

# install fonts
FONT_TMP=~/fonts_download
mkdir -p "$FONT_TMP"
cd "$FONT_TMP"
wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Tinos.zip
unzip -o Tinos.zip
cd ..
mkdir -p ~/.fonts
cp "$FONT_TMP"/*.ttf ~/.fonts/
fc-cache -fv
rm -rf "$FONT_TMP"

# install starship
curl -sS https://starship.rs/install.sh | sh -s -- -y

git clone https://github.com/yaocongchen/dotfiles.git
cd dotfiles

stow zsh starship nvim tmux

if command -v zsh >/dev/null 2>&1; then
  chsh -s "$(which zsh)" || echo "Please manually switch the default shell to zsh"
fi


echo 'export HF_HOME=/mnt/shared/cache_storage/huggingface' >> ~/.zshrc
echo 'source ~/.clearmlrc' >> ~/.zshrc
conda init zsh
conda config --set changeps1 false

exec zsh
