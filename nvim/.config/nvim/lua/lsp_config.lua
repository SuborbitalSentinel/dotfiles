local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- disable formatting by default...use null_ls to set up instead
	client.server_capabilities.documentFormattingProvider = false

	vim.keymap.set("n", "<leader>bo", "<Cmd>lua vim.lsp.buf.document_symbol()<CR>", opts)
	vim.keymap.set("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.keymap.set("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.keymap.set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.keymap.set("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	vim.keymap.set("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	vim.keymap.set("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	vim.keymap.set("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	vim.keymap.set("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	vim.keymap.set("n", "<leader>dl", "<cmd>lua vim.lsp.diagnostic.setloclist()<CR>", opts)
end

local rounded_border_handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}

local lua_runtime_path = vim.split(package.path, ";")
table.insert(lua_runtime_path, "lua/?.lua")
table.insert(lua_runtime_path, "lua/?/init.lua")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.csharpier,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.zigfmt,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.gofmt,
	},
	capabilities = capabilities,
	on_attach = function(_, bufnr)
		local opts = { noremap = true, silent = true, buffer = bufnr }
		vim.keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", opts)
	end,
})

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
		"gopls",
		"omnisharp",
		"zls",
	},
})
require("mason-lspconfig").setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			handlers = rounded_border_handlers,
		})
	end,
	["lua_ls"] = function()
		require("lspconfig")["lua_ls"].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			handlers = rounded_border_handlers,
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
						path = lua_runtime_path,
					},
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
					telemetry = {
						enable = false,
					},
				},
			},
		})
	end,
	["gopls"] = function()
		require("lspconfig")["gopls"].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			handlers = rounded_border_handlers,
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
	end,
    ["omnisharp"] = function()
        require("lspconfig")["omnisharp"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            root_dir = function(fname)
                local primary = require("lspconfig").util.root_pattern("*.sln")(fname)
                local fallback = require("lspconfig").util.root_pattern("*.csproj")(fname)
                return primary or fallback
            end,
            handlers = vim.tbl_extend("force", rounded_border_handlers, {
                ["textDocument/definition"] = require("omnisharp_extended").handler,
            }),
        })
    end,
    ["csharp_ls"] = function()
        require("lspconfig")["csharp_ls"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            root_dir = function(fname)
                local primary = require("lspconfig").util.root_pattern("*.sln")(fname)
                local fallback = require("lspconfig").util.root_pattern("*.csproj")(fname)
                return primary or fallback
            end,
            handlers = vim.tbl_extend("force", rounded_border_handlers, {
                ["textDocument/definition"] = require("csharpls_extended").handler,
            }),
        })
    end,
})
