return {
	"sindrets/diffview.nvim",
	config = function()
		local opts = { noremap = true, silent = true }
		require("diffview").setup({
			view = {
				merge_tool = {
					layout = "diff3_mixed",
					disable_diagnostics = true,
					winbar_info = true,
				},
			},
		})
		vim.opt.fillchars:append({ diff = "╱" })
		vim.keymap.set("n", "<leader>dv", "<CMD>DiffviewOpen<CR>", opts)
		vim.keymap.set("n", "<leader>df", "<CMD>DiffviewFileHistory<CR>", opts)
		vim.keymap.set("n", "<leader>dc", "<CMD>DiffviewFileHistory %<CR>", opts)
		vim.keymap.set("n", "<leader>dm", "<CMD>DiffviewOpen master<CR>", opts)
		vim.keymap.set("n", "<leader>dw", "<CMD>DiffviewClose<CR>", opts)
	end,
}
