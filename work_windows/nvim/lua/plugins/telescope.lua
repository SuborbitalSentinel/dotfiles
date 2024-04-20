return {
	"nvim-telescope/telescope.nvim",
	version = "0.1.5",
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
		local builtin = require("telescope.builtin")
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

		local function search_vimrc()
			require("telescope.builtin").find_files({
				prompt_title = "< NVIM Config >",
				cwd = "~/AppData/Local/nvim",
			})
		end

		local function search_workflows()
			builtin.live_grep({
				prompt_title = "< GitHub Workflow Search >",
				cwd = "/git/JEDIv2/.github",
			})
		end

		vim.keymap.set("n", "<leader>ws", search_workflows, opts)
		vim.keymap.set("n", "<leader>vrc", search_vimrc, opts)
		vim.keymap.set("n", "<c-f>", require("telescope.builtin").find_files, opts)
		vim.keymap.set("n", "<c-p>", require("telescope.builtin").git_files, opts)
		vim.keymap.set("n", "<c-b>", require("telescope.builtin").buffers, opts)
		vim.keymap.set("n", "<c-g>", require("telescope.builtin").live_grep, opts)
		vim.keymap.set("n", "<leader>hh", require("telescope.builtin").quickfixhistory, opts)
		vim.keymap.set("n", "<leader>ht", require("telescope.builtin").help_tags, opts)
	end,
}
