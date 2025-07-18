return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
	},
	config = function()
		require("mason").setup({
			registries = {
				"github:mason-org/mason-registry",
				"github:Crashdummyy/mason-registry",
			},
		})

		vim.lsp.enable("ts_ls")
		vim.lsp.enable("lua_ls")
		vim.lsp.enable("dartls")

		vim.lsp.enable("gopls")
		vim.lsp.config("gopls", {
			settings = {
				gopls = {
					analyses = {
						unusedparams = true,
					},
					staticcheck = true,
					templateExtensions = { "gohtml" },
				},
			},
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local bufnr = args.buf
				local opts = { noremap = true, silent = true, buffer = bufnr }
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if not client then
					return
				end

				vim.keymap.set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
				vim.keymap.set("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
				vim.keymap.set("n", "<leader>bo", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", opts)
				vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
				vim.keymap.set("n", "<leader>dl", "<cmd>lua vim.lsp.diagnostic.setloclist()<CR>", opts)
				vim.keymap.set("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
				vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
				vim.keymap.set("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
				vim.keymap.set(
					"n",
					"<leader>wl",
					"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
					opts
				)
				vim.keymap.set("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
				vim.keymap.set("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
				vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
				vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
				vim.keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
				vim.keymap.set("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
				vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
				vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					callback = function() require("conform").format({ bufnr = bufnr }) end,
				})
			end,
		})
	end,
}
