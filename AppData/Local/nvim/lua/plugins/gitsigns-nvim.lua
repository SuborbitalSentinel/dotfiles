return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local opts = { noremap = true, silent = true }
		local gitsigns = require("gitsigns")

		gitsigns.setup()
		vim.keymap.set("n", "[c", function() gitsigns.nav_hunk("prev") end, opts)
		vim.keymap.set("n", "]c", function() gitsigns.nav_hunk("next") end, opts)
		vim.keymap.set("n", "td", gitsigns.preview_hunk_inline, opts)
	end,
}
