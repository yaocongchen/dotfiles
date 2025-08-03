# dotfiles
## 1. Update & Upgrade system
```shell
sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade -y  && sudo apt-get clean
```

## 2. Install zsh
```shell
sudo apt-get install zsh
```

## 3. Install starship
```shell
sudo apt-get install starship
```

## 4. Install font
```shell
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Tinos.zip
sudo apt-get install zip
unzip Tinos.zip
mkdir -p ~/.fonts
cp ~/Tinos/*.ttf ~/.fonts/
fc-cache -fv
```

## 5. Install stow
```shell
sudo apt-get install stow
```

## 6. clone this repo.
```shell
git clone https://github.com/yaocongchen/dotfiles.git
```

## 7. Enter the dotfiles folder
```shell
cd dotfiles
```



## 8. Install fzf
```shell
sudo apt-get install fzf
```

## 9. Install nvm
1. 安裝 nvm（Node 版本管理器）
```shell
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
```

2. 讓 shell 支援 nvm (若 .zshrc 本身已寫可以不用做,否則會有重複的問題)
```shell
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
```

3. 安裝 node（會附帶 npm）
```shell
nvm install --lts
```
## 10. stow inter folder
```shell
stow zsh starship nvim tmux
```


# tmux
## 指令客製化
| Key | 功能 |
|-----|-----|
| Alt + c | 清空 Terminal |
| ctrl + s |  prefix 鍵 (原 ctrl + b) |
| ctrl + h| 往左切換 pane |
| ctrl + j| 往下切換 pane |
| ctrl + k| 往上切換 pane |
| ctrl + l| 往右切換 pane |