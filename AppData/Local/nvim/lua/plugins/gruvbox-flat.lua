return {
	"eddyekofo94/gruvbox-flat.nvim",
	priority = 1000,
	enabled = true,
	config = function()
		vim.g.gruvbox_flat_style = "hard"
		vim.cmd([[colorscheme gruvbox-flat]])
	end,
}
