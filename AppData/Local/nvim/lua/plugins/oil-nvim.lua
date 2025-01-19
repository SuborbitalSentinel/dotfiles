return {
	"stevearc/oil.nvim",
	lazy = false,
	config = function()
		require("oil").setup({
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
		})
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
	end,
}
