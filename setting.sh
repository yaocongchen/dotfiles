# 1. Update & Upgrade system
sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade -y && sudo apt-get clean

# 2. Install packages
sudo apt-get install -y \
    build-essential \
    git \
    wget \
    curl \
    wl-clipboard \
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
    luarocks \

# Install miniconda
curl -LO https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/miniconda
source $HOME/miniconda/bin/activate
conda init
rm -rf Miniconda3-latest-Linux-x86_64.sh

# Install neovim
yes '' | sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update && sudo apt-get install -y neovim

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
cat <<'EOF' >>~/.bashrc

# nvm initialization
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
EOF

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source ~/.cargo/env
rustup update
# Install yazi
cargo install --locked yazi-fm yazi-cli

source ~/.bashrc

# load nvm manually
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Install node
nvm install --lts

# Install font
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

# Install lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/

# Install starship
curl -sS https://starship.rs/install.sh | sh -s -- -y

git clone https://github.com/yaocongchen/dotfiles.git
cd dotfiles

stow zsh starship nvim tmux yazi
cd

# Set Zsh as the default login shell
if command -v zsh >/dev/null 2>&1; then
    sudo chsh -s "$(which zsh)" || echo "Please manually switch the default shell to zsh"
fi

conda init zsh
# no show (env name because starship already processed)
conda config --set changeps1 false

exec zsh

