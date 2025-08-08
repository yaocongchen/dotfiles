-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- ~/.config/nvim/lua/config/keymaps.lua

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- 快捷鍵：Ctrl+S 存檔
-- map("n", "<C-s>", "<cmd>w<cr>", { desc = "Save file", noremap = true, silent = true })
vim.keymap.set("n", "<C-s>", function()
  vim.cmd("write")  -- 存檔
  vim.notify("✔ Saved!", vim.log.levels.INFO, { title = "File Save" })
end, { desc = "Save file with notification", noremap = true, silent = true })

-- 快捷鍵：Ctrl+c 關閉視窗
map("n", "<C-c>", "<cmd>q<cr>", { desc = "Close window", noremap = true, silent = true })

-- 快捷鍵：Ctrl+Shift+C 離開全部
map("n", "<C-A-c>", "<cmd>qa<cr>", { desc = "Quit all", noremap = true, silent = true })

