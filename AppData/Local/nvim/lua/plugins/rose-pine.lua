return {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = false,
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("rose-pine").setup({
			variant = "moon",
			dark_variant = "moon",
			extend_background_behind_border = true,
		})
		vim.cmd([[ colorscheme rose-pine ]])
	end,
}
