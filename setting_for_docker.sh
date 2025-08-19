#!/usr/bin/env bash

apt-get update && apt-get install -y \
    build-essential \
    git \
    wget \
    curl \
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
    fontconfig \
    stow \
    fzf \
    ripgrep \
    fd-find \
    lua5.1 \
    luarocks

apt autoremove -y

# The reason for doing apt-get update && apt-get install -y before doing this step is that the initialized image PPA is not fully functional.
yes '' | add-apt-repository ppa:neovim-ppa/unstable
apt-get update && apt-get install -y neovim

# huggingface-cli login
pip install huggingface_hub
huggingface-cli login --token YOUR_HUGGINGFACE_TOKEN

echo 'export HF_HOME=/mnt/shared/cache_storage/huggingface' >>~/.bashrc

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
cat <<'EOF' >>~/.bashrc

# nvm initialization
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
EOF

# install rust ,but installation took too long so clearml timeout
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source ~/.cargo/env
rustup update
# install yazi
cargo install --locked yazi-fm yazi-cli

# Install lsd
cargo install lsd


# conda
conda init bash
source ~/.bashrc

# load nvm manually
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# install node
nvm install --lts

# time zone
TZ=Asia/Taipei
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime
echo $TZ >/etc/timezone
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

# install lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
install lazygit -D -t /usr/local/bin/
rm -rf lazygit.tar.gz lazygit

# install starship
curl -sS https://starship.rs/install.sh | sh -s -- -y

git clone https://github.com/yaocongchen/dotfiles.git
cd dotfiles

stow zsh starship nvim tmux yazi

# Set Zsh as the default login shell
if command -v zsh >/dev/null 2>&1; then
    chsh -s "$(which zsh)" || echo "Please manually switch the default shell to zsh"
fi

echo 'export HF_HOME=/mnt/shared/cache_storage/huggingface' >>~/.zshrc
echo 'source ~/.clearmlrc' >>~/.zshrc
conda init zsh
# no show (env name because starship already processed)
conda config --set changeps1 false

# Exit the default virtual environment
cat <<'EOF' >>~/.zshrc
if command -v conda >/dev/null 2>&1 && [[ -n "$CONDA_PREFIX" ]]; then
    conda deactivate
elif [[ -n "$VIRTUAL_ENV" ]]; then
    deactivate
fi
EOF

exec zsh
