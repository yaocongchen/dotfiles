#!/usr/bin/env bash   
# 是 shebang，用來指定這個腳本要用哪個 shell 執行。
set -e  # 會讓 bash 腳本在遇到任何指令失敗（非 0 結束碼）時立即停止執行。

# 1. Update & Upgrade system
apt-get update
apt-get install -y software-properties-common gnupg curl ca-certificates wget zip locales g++
yes '' | add-apt-repository ppa:neovim-ppa/unstable

# 2. Install zsh
apt-get install -y zsh

# 3. Install starship
curl -sS https://starship.rs/install.sh | sh -s -- -y

# 4. Install neovim
apt-get install -y neovim

# 5. Install tmux
apt-get install -y tmux

# 6. Install fontconfig
apt-get install -y fontconfig

# 7. 設定 locale，避免亂碼
locale-gen en_US.UTF-8
export LANG=en_US.UTF-8

# 8. 安裝字型
FONT_TMP=~/fonts_download
mkdir -p "$FONT_TMP"
cd "$FONT_TMP"
wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Tinos.zip
unzip -o Tinos.zip
cd ..
mkdir -p ~/.fonts
cp "$FONT_TMP"/*.ttf ~/.fonts/
fc-cache -fv
rm -rf "$FONT_TMP"

# 9. Install stow
apt-get install -y stow

# 10. Clone this repo (請視情況執行)
# git clone https://github.com/yaocongchen/dotfiles.git

# 11. 進入 dotfiles 資料夾 (請視情況執行)
cd dotfiles

# 12. stow inter folder
stow zsh starship nvim tmux

# 13. 設定 zsh 為預設 shell
if command -v zsh >/dev/null 2>&1; then
  chsh -s "$(which zsh)" || echo "請手動切換預設 shell 為 zsh"
fi

# 14. 啟動 zsh
exec zsh