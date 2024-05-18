return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				json = { "prettier" },
				cs = { "csharpier" },
				python = { "black" },
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 5000,
			})
		end)

		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("CSAutoSaveAuGroup", { clear = true }),
			pattern = { "*.cs" },
			callback = function(args)
				require("conform").format({ bufnr = args.buf, async = false, timeout_ms = 5000 })
			end,
		})
	end,
}
