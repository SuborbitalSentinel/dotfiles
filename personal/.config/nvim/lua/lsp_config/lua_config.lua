local M = {}

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

M.handlers = {
   ["textDocument/hover"] = vim.lsp.with( vim.lsp.handlers.hover, { border = "rounded" }),
   ["textDocument/signatureHelp"] = vim.lsp.with( vim.lsp.handlers.signature_help, { border = "rounded" }),
}

M.settings = {
   Lua = {
      runtime = {
         version = 'LuaJIT',
         path = runtime_path,
      },
      diagnostics = {
         globals = {'vim'},
      },
      workspace = {
         library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
         enable = false,
      },
   },
}

return M
