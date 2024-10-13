local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
print("lazy vim path:==>", lazypath)
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup({ { import = "plugins" }, { import = "plugins.lsp"} }, {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})
vim.cmd.colorscheme("catppuccin")
