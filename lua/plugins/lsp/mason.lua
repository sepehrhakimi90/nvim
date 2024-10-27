return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "jay-babu/mason-null-ls.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_nullls = require("mason-null-ls")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "html",
        "cssls",
        "tailwindcss",
        "lua_ls",
        "gopls",
        "bashls",
        "clangd",
        "rust_analyzer",
      },
    })


    mason_nullls.setup({
      ensure_installed = {
        "stylua",
        "gofumpt",
        "goimports_reviser",
        "golines",
        "dxfmt",
        "leptosfmt",
      },
    })
  end,
}
