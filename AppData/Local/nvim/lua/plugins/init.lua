return {
	"godlygeek/tabular",
	"tpope/vim-repeat",
	"tpope/vim-surround",
	"tpope/vim-unimpaired",
	{ "kyazdani42/nvim-web-devicons", lazy = true },
	{ "aymericbeaumet/vim-symlink", dependencies = { "moll/vim-bbye" } },

	{
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup() end,
	},

	{
		"numToStr/Comment.nvim",
		config = function() require("Comment").setup() end,
	},
}
