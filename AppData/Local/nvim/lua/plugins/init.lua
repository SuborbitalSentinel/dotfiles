return {
	"godlygeek/tabular",
	"tpope/vim-repeat",
	"tpope/vim-surround",
	"tpope/vim-unimpaired",
	-- "github/copilot.vim",
	{
		"SuborbitalSentinel/peek.nvim",
		event = { "VeryLazy" },
		build = "deno task --quiet build:fast",
		config = function()
			require("peek").setup()
			vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
			vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
		end,
	},
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
