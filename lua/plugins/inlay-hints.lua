return {
	"lvimuser/lsp-inlayhints.nvim",
	config = function()
		require("lsp-inlayhints").setup({
			inlay_hints = {
				parameter_hints = { show = true },
				type_hints = { show = true },
			},
		})
	end,
}