-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.relativenumber = true

vim.opt.sidescrolloff = 30
vim.opt.colorcolumn = "80"

vim.opt.tabstop = 4
vim.opt.shiftwidth = 0
vim.opt.softtabstop = -1

local original_handler = vim.lsp.handlers["$/progress"]
vim.lsp.handlers["$/progress"] = function(_, result, ctx, ...)
  if not result or not result.token then
    return
  end

  local client = vim.lsp.get_client_by_id(ctx.client_id)
  if client and client.name == "roslyn" then
    return
  end

  if original_handler then
    return original_handler(_, result, ctx, ...)
  end
end
