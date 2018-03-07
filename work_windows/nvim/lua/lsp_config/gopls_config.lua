local M = {}

M.cmd = { 'gopls', 'serve' }
M.settings = {
   gopls = {
      analyses = {
         unusedparams = true,
      },
      staticcheck = true,
   },
}
M.handlers = { 
   ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = "rounded"}),
   ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = "rounded"}),
}

return M
