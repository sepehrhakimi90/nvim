return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			window = {
				mappings = {
					["<leader>ec"] = "expand_all_nodes",
					["<leader>er"] = "refresh",
					["v"] = "open_split",
				},
			},
			filesystem = {
				filtered_items = {
					visible = true,
					show_hidden_count = true,
					hide_dotfiles = false,
					hide_gitignored = true,
					hide_by_name = {
						-- add extension names you want to explicitly exclude
						-- '.git',
						-- '.DS_Store',
						-- 'thumbs.db',
					},
					never_show = {},
				},
			},
			default_component_configs = {
				indent = {
					with_expanders = true,
					expander_collapsed = "",
					expander_expanded = "",
					expander_highlight = "NeoTreeExpander",
				},
			},
		})
		vim.keymap.set("n", "<leader>ee", ":Neotree filesystem reveal left toggle=true<CR>", {})
		vim.keymap.set("n", "<leader>ef", function()
			require("neo-tree.command").execute({
				action = "focus", -- OPTIONAL, this is the default value
				source = "filesystem", -- OPTIONAL, this is the default value
				position = "left", -- OPTIONAL, this is the default value
				reveal_file = reveal_file, -- path to file or folder to reveal
				reveal_force_cwd = true, -- change cwd without asking if needed
			})
		end, { desc = "Open neo-tree at current file or working directory" })
		vim.keymap.set("n", "<leader>eb", function()
			require("neo-tree.command").execute({
				action = "show", -- OPTIONAL, this is the default value
				source = "buffers", -- OPTIONAL, this is the default value
				position = "left", -- OPTIONAL, this is the default value
				toggle = true,
			})
		end, { desc = "Open neo-tree at current file or working directory" })
	end,
}
