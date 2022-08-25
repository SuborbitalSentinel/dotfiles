local lspconfig = require'lspconfig'

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.keymap.set(...) end

    -- Mappings.
    local opts = { buffer=bufnr, noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    if client.name == 'omnisharp' then
        buf_set_keymap('n', 'gd', '<Cmd>lua require("omnisharp_extended").lsp_definitions()<CR>', opts)
    else
        buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    end
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

-- cmd = { "omnisharp.exe", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
local servers = {
    omnisharp = {
        cmd = { "omnisharp.exe" },
        handlers = { 
           ["textDocument/definition"] = require('omnisharp_extended').handler,
           ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = "rounded"}),
           ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = "rounded"}),
        },
    },
    powershell_es = {
        bundle_path = 'c:/w/PowerShellEditorServices',
    },
    gopls = {
        cmd = { 'gopls', 'serve' },
        settings = {
           gopls = {
              analyses = {
                 unusedparams = true,
              },
              staticcheck = true,
           },
        },
        handlers = { 
           ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = "rounded"}),
           ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = "rounded"}),
        },
    },
    pylsp = {
        handlers = { 
           ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = "rounded"}),
           ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = "rounded"}),
        },
    },
    jsonls = {},
}

for name, config in pairs(servers) do
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    config.capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

    config.on_attach = on_attach
    config.flags = { debounce_text_changes = 150 }
    lspconfig[name].setup(config)
end

