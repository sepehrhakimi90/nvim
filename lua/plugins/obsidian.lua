return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  -- lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "/home/nil/myObs/mine",
      },
    },

    templates = {
      folder = "template",
      date_format = "%Y-%m-%d-%a",
      time_format = "%H:%M",
    },
    picker = {
      -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
      name = "telescope.nvim",
      -- Optional, configure key mappings for the picker. These are the defaults.
      -- Not all pickers support all mappings.
      note_mappings = {
        -- Create a new note from your query.
        new = "<C-x>",
        -- Insert a link to the selected note.
        insert_link = "<C-l>",
      },
      tag_mappings = {
        -- Add tag(s) to current note.
        tag_note = "<C-x>",
        -- Insert a tag at the current location.
        insert_tag = "<C-l>",
      },
    },
  },
  cmd = { "ObsidianOpen", "ObsidianNew", "ObsidianSearch" },
  init = function()
    -- Global settings that should apply to Markdown files, regardless of plugin loading
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "markdown",
      callback = function()
        vim.opt_local.conceallevel = 2 -- Adjust to your preference (e.g., 1, 2, or 3)
      end,
    })

    vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<CR>", { desc = "Search Obsidian Notes" })
    vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianOpen<CR>", { desc = "Open Obsidian" })
    vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<CR>", { desc = "Create new note" })
    vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianToday<CR>", { desc = "Creat today note" })
    vim.keymap.set("n", "<leader>op", function()
      vim.ui.input({ prompt = "Enter image name: " }, function(input)
        if input and input ~= "" then
          vim.cmd("ObsidianPasteImg " .. input)
        else
          print("Aborted: No note name provided.")
        end
      end)
    end, { desc = "Paste Image" })
    vim.keymap.set("n", "<leader>on", function()
      vim.ui.input({ prompt = "Enter new note name: " }, function(input)
        if input and input ~= "" then
          vim.cmd("ObsidianNew " .. input)
        else
          print("Aborted: No note name provided.")
        end
      end)
    end, { desc = "Create a New Obsidian Note" })
  end,
}
