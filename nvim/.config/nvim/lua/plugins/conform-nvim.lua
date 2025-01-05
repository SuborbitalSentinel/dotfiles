return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				cs = { "csharpier" },
				css = { "prettier" },
				go = { "gofmt" },
				html = { "prettier" },
				javascript = { "prettier" },
				json = { "prettier" },
				lua = { "stylua" },
				python = { "black" },
				rust = { "rustfmt" },
				zig = { "zigfmt" },
			},
		})

		vim.keymap.set(
			{ "n", "v" },
			"<leader>f",
			function()
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 5000,
				})
			end
		)
	end,
}
