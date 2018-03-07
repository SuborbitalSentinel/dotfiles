local M = {}

M.handlers = {
   ["textDocument/hover"] = vim.lsp.with( vim.lsp.handlers.hover, { border = "rounded" }),
   ["textDocument/signatureHelp"] = vim.lsp.with( vim.lsp.handlers.signature_help, { border = "rounded" }),
}

M.cmd = { "typescript-language-server", "--stdio" }
M.filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
M.init_options = { hostInfo = "neovim" }
M.root_dir = require('lspconfig.util').root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")

return M
