# dotfiles
## 1. Update & Upgrade system
```bash
sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade -y  && sudo apt-get clean
```

## 2. Install zsh
```bash
sudo apt-get install zsh
```

## 3. Install starship
```bash
sudo apt-get install starship
```

## 4. Install font
```bash
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Tinos.zip
sudo apt-get install zip
unzip Tinos.zip
mkdir -p ~/.fonts
cp ~/Tinos/*.ttf ~/.fonts/
fc-cache -fv
```

## 5. Install stow
```bash
sudo apt-get install stow
```

## 6. clone this repo.
```bash
git clone https://github.com/yaocongchen/dotfiles.git
```

## 7. Enter the dotfiles folder
```bash
cd dotfiles
```



## 8. Install fzf
```shell
sudo apt-get install fzf
```

## 9. Install nvm
1. Install nvm (Node Version Manager)
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
```

2. Enable nvm support in the shell (this is not necessary if .zshrc is already written, otherwise there will be duplication issues)
```bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
```

1. 安裝 node（會附帶 npm）
```bash
nvm install --lts
```

## 10. Install yazi
```bash
# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.cargo/env
rustup update
# install yazi
cargo install --locked yazi-fm yazi-cli
```

## 11. stow inter folder
```bash
stow zsh starship nvim tmux yazi
```

## 12. autoremove
```bash
apt autoremove -y
```

# tmux
## 指令客製化
| Key | 功能 |
|-----|-----|
| Alt + c | 清空 Terminal |
| ctrl + d |  prefix 鍵  |
| ctrl + h| 往左切換 pane |
| ctrl + j| 往下切換 pane |
| ctrl + k| 往上切換 pane |
| ctrl + l| 往右切換 pane |
