local M = {}

local pid = vim.fn.getpid()
   
local omnisharp_bin = vim.fn.system({'which', 'omnisharp.exe'}):gsub("C:", ""):gsub("\\", "/"):gsub("[\r\n]", "")

M.cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) }
M.handlers = { 
   ["textDocument/definition"] = require('omnisharp_extended').handler,
   ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = "rounded"}),
   ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = "rounded"}),
}

return M
