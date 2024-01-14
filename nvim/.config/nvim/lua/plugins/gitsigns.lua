return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local opts = { noremap = true, silent = true }
		local gitsigns = require("gitsigns")

		gitsigns.setup()
		vim.keymap.set("n", "[c", gitsigns.prev_hunk, opts)
		vim.keymap.set("n", "]c", gitsigns.next_hunk, opts)
	end,
}
