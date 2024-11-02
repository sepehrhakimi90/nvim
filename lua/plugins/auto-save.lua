return {
  "Pocco81/auto-save.nvim",
  config = function()
    require("auto-save").setup({
      enabled = true, -- Start enabled at startup
      execution_message = {
        message = function()
          return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
        end,
        dim = 0.18,
        cleaning_interval = 1250,
      },
      trigger_events = { "InsertLeave", "TextChanged" }, -- Events that trigger an auto-save
      -- Conditional function to determine whether to auto-save
      condition = function(buf)
        local fn = vim.fn
        local utils = require("auto-save.utils.data")

        if
            fn.getbufvar(buf, "&modifiable") == 1
            and utils.not_in(fn.getbufvar(buf, "&filetype"), { "gitcommit", "markdown" })
        then
          return true -- Save on modifiable and non-blacklisted filetypes
        end
        return false
      end,
      write_all_buffers = false, -- Only save the current buffer
      debounce_delay = 135,   -- Debounce delay in milliseconds
      callbacks = {           -- Callbacks for notifications or hooks
        enabling = nil,
        disabling = nil,
        before_asserting_save = nil,
        before_saving = nil,
        after_saving = nil,
      },
    })
  end,
}
