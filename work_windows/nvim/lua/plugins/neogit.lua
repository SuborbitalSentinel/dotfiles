return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",

		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("neogit").setup({})
		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "<leader>gg", function ()
			require("neogit").open()
		end, opts)
		vim.keymap.set("n", "<leader>gs", function ()
			require("neogit").open({ kind = "vsplit" })
		end, opts)
	end,
}
