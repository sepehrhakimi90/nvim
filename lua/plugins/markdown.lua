return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "echasnovski/mini.nvim",
    "echasnovski/mini.icons",
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
  },
  -- dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, -- if you use standalone mini plugins
  -- dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  config = function()
    require("render-markdown").setup({
      update_interval = 200, -- Update preview every 200 ms
      auto_start = true,  -- Automatically start rendering
    })
  end,
}
