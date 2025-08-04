return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "storm", -- 可選：storm, night, moon, day
    transparent = true, --  啟用透明背景
    terminalcolors = true,
    styles = {
      sidebars = "transparent", -- 邊欄透明
      floats = "transparent", -- 浮動視窗透明
    },
  },
  config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd.colorscheme("tokyonight")
  end,
}
