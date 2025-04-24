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
stow zsh
stow starship
stow nvim
stow tmux
```


