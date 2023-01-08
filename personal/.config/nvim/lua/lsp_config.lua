local lspconfig = require('lspconfig')

local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    local null_ls_formatters = {
        ['omnisharp'] = true
    }

    if null_ls_formatters[client.name] then
        client.server_capabilities.documentFormattingProvider = false
    end

    if client.name == 'omnisharp' then
        vim.keymap.set('n', 'gd', '<Cmd>lua require("omnisharp_extended").lsp_definitions()<CR>', opts)
    else
        vim.keymap.set('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    end

    vim.keymap.set('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.keymap.set('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.keymap.set('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.keymap.set('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.keymap.set('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.keymap.set('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.keymap.set('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.keymap.set('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    vim.keymap.set('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    vim.keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", opts)
end

local rounded_border_handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}

local lua_runtime_path = vim.split(package.path, ';')
table.insert(lua_runtime_path, "lua/?.lua")
table.insert(lua_runtime_path, "lua/?/init.lua")

local servers = {
    sumneko_lua = {
        handlers = rounded_border_handlers,
        settings = {
            Lua = {
                runtime = {
                    version = 'LuaJIT',
                    path = lua_runtime_path,
                },
                diagnostics = {
                    globals = { 'vim' },
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                telemetry = {
                    enable = false,
                },
            },
        }
    },
    gopls = {
        cmd = { 'gopls', 'serve' },
        handlers = rounded_border_handlers,
        settings = {
            gopls = {
                analyses = {
                    unusedparams = true,
                },
                staticcheck = true,
            },
        }
    },
    rust_analyzer = {
        handlers = rounded_border_handlers,
        settings = {
            rust = {
                unstable_features = true,
                build_on_save = false,
                all_features = true,
            }
        }
    },
    omnisharp = {
        cmd = { "omnisharp" },
        handlers = vim.tbl_extend('force', rounded_border_handlers, {
            ['textDocument/definition'] = require('omnisharp_extended').handler,
        }),
    },
    jedi_language_server = {
        handlers = rounded_border_handlers
    },
}

require('mason').setup()
require('mason-lspconfig').setup({ ensure_installed = { "sumneko_lua", "rust_analyzer", "gopls", "omnisharp" } })

local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.csharpier
    }
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
for name, config in pairs(servers) do
    config.on_attach = on_attach
    config.capabilities = capabilities
    lspconfig[name].setup(config)
end
