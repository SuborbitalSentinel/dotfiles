return {
	"sindrets/diffview.nvim",
	config = function()
		require("diffview").setup({})
		vim.keymap.set("n", "<leader>dv", "<CMD>DiffviewOpen<CR>")
		vim.keymap.set("n", "<leader>df", "<CMD>DiffviewFileHistory<CR>")
		vim.keymap.set("n", "<leader>dc", "<CMD>DiffviewFileHistory %<CR>")
		vim.keymap.set("n", "<leader>dm", "<CMD>DiffviewOpen master<CR>")
		vim.keymap.set("n", "<leader>dq", "<CMD>DiffviewClose<CR>")
	end,
}
