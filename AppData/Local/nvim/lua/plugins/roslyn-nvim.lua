return {
	"seblyng/roslyn.nvim",
	dependencies = {
		"saghen/blink.cmp",
	},
	ft = "cs",
	opts = {
		config = {
			capabilities = require("blink.cmp").get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities()),
		},
	},
}
