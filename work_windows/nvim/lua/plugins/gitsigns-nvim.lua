return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local opts = { noremap = true, silent = true }
		local gitsigns = require("gitsigns")

		gitsigns.setup()
		vim.keymap.set("n", "[c", gitsigns.prev_hunk, opts)
		vim.keymap.set("n", "]c", gitsigns.next_hunk, opts)
		vim.keymap.set("n", "td", gitsigns.toggle_deleted, opts)
		vim.keymap.set("n", "<leader>ghr", gitsigns.reset_hunk, opts)
		vim.keymap.set("v", "<leader>ghr", function ()
			gitsigns.reset_hunk({vim.fn.line('.'), vim.fn.line('v')})
		end, opts)
		-- vim.keymap.set("n", "<leader>gbb", gitsigns.toggle_current_line_blame, opts)
		vim.keymap.set("n", "<leader>gbl", function()
			gitsigns.blame_line({ full = true })
		end, opts)
	end,
}
