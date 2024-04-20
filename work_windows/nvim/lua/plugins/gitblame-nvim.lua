return {
	"FabijanZulj/blame.nvim",
	config = function ()
		local opts = { noremap = true, silent = true }
		require('blame').setup({
			format = function(blame)
				return string.format("%s %s %s", blame.author, blame.date, blame.summary)
			end,
		})
		vim.keymap.set("n", "<leader>gbb", "<CMD>BlameToggle<CR>", opts)
	end
}

