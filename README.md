# 使用方法
## 使用有 GUI 的作業系統
>先下載 lazyvim 支援的 terminal (如： [Ghostty](https://ghostty.org/download) ) 防止顯色或圖示異常。

下載或是複製 `setting.sh` 的內容。
接著，
```bash
bash setting.sh
```
將 zsh 設定為預設的 shell
```bash
chsh -s "$(which zsh)"
```
最後，重新啟動系統（此步驟為套用設定最乾脆的方法）。

## 使用 docker 的環境
下載或是複製 `setting_for_docker.sh` 的內容。
接著，
```bash
bash setting_for_docker.sh
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
