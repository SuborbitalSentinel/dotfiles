return {
	"nvim-telescope/telescope.nvim",
	version = "0.1.8",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-telescope/telescope-ui-select.nvim",
		"natecraddock/telescope-zf-native.nvim",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local opts = { noremap = true, silent = true }

		local actions = require("telescope.actions")
		local telescope = require("telescope")
		telescope.setup({
			defaults = {
				layout_strategy = "vertical",
				path_display = { "truncate" },
				mappings = {
					i = {
						["<C-q>"] = actions.send_selected_to_qflist,
						["<C-w>"] = actions.send_to_qflist,
						["<C-d>"] = actions.delete_buffer,
					},
					n = {
						["<C-q>"] = actions.send_selected_to_qflist,
						["<C-w>"] = actions.send_to_qflist,
						["<C-d>"] = actions.delete_buffer,
					},
				},
			},
		})
		telescope.load_extension("zf-native")
		telescope.load_extension("ui-select")
		local builtin = require("telescope.builtin")

		local function find_vimrc_file()
			builtin.find_files({
				prompt_title = "< NVIM Config >",
				cwd = vim.fn.stdpath("config"),
			})
		end

		local function grep_vimrc_file()
			builtin.live_grep({
				prompt_title = "< NVIM Config >",
				cwd = vim.fn.stdpath("config"),
			})
		end

		vim.keymap.set("n", "<leader>vrc", find_vimrc_file, opts)
		vim.keymap.set("n", "<leader>grc", grep_vimrc_file, opts)
		vim.keymap.set("n", "<c-f>", builtin.find_files, opts)
		vim.keymap.set("n", "<c-p>", builtin.git_files, opts)
		vim.keymap.set("n", "<c-b>", builtin.buffers, opts)
		vim.keymap.set("n", "<c-g>", builtin.live_grep, opts)
		vim.keymap.set("n", "<leader>hh", builtin.quickfixhistory, opts)
		vim.keymap.set("n", "<leader>ht", builtin.help_tags, opts)
	end,
}
