local M = {}

M.handlers = {
   ["textDocument/hover"] = vim.lsp.with( vim.lsp.handlers.hover, { border = "rounded" }),
   ["textDocument/signatureHelp"] = vim.lsp.with( vim.lsp.handlers.signature_help, { border = "rounded" }),
}

M.settings = {
   rust = {
      unstable_features = true,
      build_on_save = false,
      all_features = true,
   }
}

return M
