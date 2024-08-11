vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.g.mapleader = " "

vim.opt.spelllang = "en_us"
vim.opt.spell = true

vim.keymap.set("n", "<C-t>n", ":tabnew<cr>", {})
vim.keymap.set("n", "<C-t>c", ":tabc<cr>", {})
vim.keymap.set("n", "<C-t>l", "gt", {})
vim.keymap.set("n", "<C-t>h", "gT", {})
vim.keymap.set("n", "<C-t>o", ":tabo<cr>", {})
