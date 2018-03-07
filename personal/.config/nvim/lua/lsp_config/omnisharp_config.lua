local M = {}

local pid = vim.fn.getpid()
local omnisharp_bin = "/home/kapiushon/.local/src/omnisharp-linux-x64/run"

M.handlers = {
   ["textDocument/definition"] = require('omnisharp_extended').handler,
   ["textDocument/hover"] = vim.lsp.with( vim.lsp.handlers.hover, { border = "rounded" }),
   ["textDocument/signatureHelp"] = vim.lsp.with( vim.lsp.handlers.signature_help, { border = "rounded" }),
}

M.cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) }

return M
