return {
  {
    "williamboman/mason.nvim",
    main = "mason",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls", "gopls", "bashls", "clangd", "rust_analyzer" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      local util = require("lspconfig/util")
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.gopls.setup({
        capabilities = capabilities,
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = util.root_pattern("go.work", "go.mod", ".git"),
        settings = {
          gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
              unusedparams = true,
            },
          },
        },
      })
      lspconfig.bashls.setup({
        capabilities = capabilities,
        cmd = { "bash-language-server", "start" },
        filetypes = { "sh" },
        settings = {
          bashIde = {
            globPattern = "*@(.sh|.inc|.bash|.command)",
          },
        },
        single_file_support = true,
      })
      lspconfig.clangd.setup({
        capabilities = capabilities,
      })
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {
            assist = {
              importGranularity = "module",
              importPrefix = "by_self",
            },
            cargo = {
              loadOutDirsFromCheck = true,
            },
            procMacro = {
              enable = true,
            },
            inlayHints = {
              enable = true,
              typeHints = {
                enable = true,
              },
              parameterHints = {
                enable = true,
              },
            },
          },
        },
        on_attach = function(client, bufnr)
          -- Enable inlay hints
          require("lsp-inlayhints").on_attach(client, bufnr)
        end,
      })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<space>hh", function()
        vim.lsp.inlay_hint.enable(true, { 0 })
      end, {})
    end,
  },
}
