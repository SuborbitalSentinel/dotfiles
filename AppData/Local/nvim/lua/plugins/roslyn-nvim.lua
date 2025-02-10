return {
	"seblyng/roslyn.nvim",
	dependencies = {
		"saghen/blink.cmp",
	},
	ft = "cs",
	opts = {
		config = {
			capabilities = require("blink.cmp").get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities()),
			handlers = {
				["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
				["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
			},
		},
	},
}
