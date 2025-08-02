return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,         -- 顯示隱藏項（變灰）
        hide_dotfiles = true,   -- 初始仍隱藏 dotfiles，按 Ctrl+h 後會切換
        hide_gitignored = false,
      },
    },
    window = {
      mappings = {
        ["<C-h>"] = "toggle_hidden",  -- ✅ 加入 Ctrl+h 快捷鍵
      },
    },
  },
}
