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

## 8. stow inter folder
```shell
stow zsh starship nvim tmux
```

## 9. Install fzf
```shell
sudo apt-get install fzf
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