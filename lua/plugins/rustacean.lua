return {
  "mrcjkb/rustaceanvim",
  version = "^5", -- Recommended version specifier
  lazy = false,   -- Load the plugin immediately
  config = function()
    -- Enable RustaceanVim
    vim.g.rustaceanvim = {
      -- Plugin configuration
      tools = {},
      -- LSP configuration
      server = {
        on_attach = function(client, bufnr)
          -- you can also put keymaps in here
          -- require("lsp-inlayhints").on_attach(client, bufnr)
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
          -- Toggle LSP inlay hints with <leader>ih
          vim.keymap.set('n', '<leader>ih', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
          end, { noremap = true, silent = true })
        end,
        default_settings = {
          -- rust-analyzer language server configuration
          ["rust-analyzer"] = {
            inlayHints = {
              lifetimeElisionHints = {
                enable = true,
                useParameterNames = true,
              },
              reborrowHints = {
                enable = true,
              },
              bindingModeHints = {
                enable = true,
              },
              closureReturnTypeHints = {
                enable = true,
              },
              parameterHints = {
                enable = true,
              },
              typeHints = {
                enable = true,
                hideClosureInitialization = false,
                hideNamedConstructor = false,
              },
              chainingHints = { enable = true },
              closingBraceHints = { enable = true },
            },
          },
        },
      },
      -- DAP configuration
      dap = {},
    }

    -- Optional: Additional keybindings or settings
    vim.api.nvim_set_keymap("n", "<leader>cb", ":CargoBuild<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>ct", ":CargoTest<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>cr", ":CargoRun<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader><F5>", ":RustLsp run<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>em", ":RustLsp expandMacro<CR>", { noremap = true, silent = true })
  end,
}
