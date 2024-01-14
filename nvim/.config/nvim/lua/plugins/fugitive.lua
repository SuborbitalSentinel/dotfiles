return {
	"tpope/vim-fugitive",
	keys = {
		{ "<leader>gs", "<CMD>Git<CR>", noremap = true, silent = true },
		{ "<leader>gl", "<CMD>silent! Gclog<CR><C-L>", noremap = true, silent = true },
		{ "<leader>gb", "<CMD>Git blame<CR>", noremap = true, silent = true },
		{ "<leader>gd", "<CMD>Gdiffsplit<CR>", noremap = true, silent = true },
		{ "<leader>gr", "<CMD>Gread<CR>", noremap = true, silent = true },
		{ "<leader>gw", "<CMD>Gwrite<CR>", noremap = true, silent = true },
		{ "<leader>ge", "<CMD>Gedit<CR>", noremap = true, silent = true },
	},
}
