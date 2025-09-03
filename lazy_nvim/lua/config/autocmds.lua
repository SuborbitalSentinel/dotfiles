-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = vim.api.nvim_create_augroup("GolangAuGroup", { clear = true }),
  pattern = { "*.go" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = false
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufEnter" }, {
  group = vim.api.nvim_create_augroup("ComposeAuGroup", { clear = true }),
  pattern = { "compose.yml" },
  callback = function()
    vim.cmd([[setfiletype yaml.docker-compose]])
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = vim.api.nvim_create_augroup("RazorAuGroup", { clear = true }),
  pattern = { "*.razor" },
  callback = function()
    vim.cmd([[setfiletype razor]])
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = vim.api.nvim_create_augroup("XamlAuGroup", { clear = true }),
  pattern = { "*.xaml", "*.axaml" },
  callback = function()
    vim.cmd([[setfiletype xml]])
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = vim.api.nvim_create_augroup("HtmlAuGroup", { clear = true }),
  pattern = { "*.html", "*.gotmpl" },
  callback = function()
    vim.cmd([[setfiletype html]])
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = vim.api.nvim_create_augroup("MarkdownAuGroup", { clear = true }),
  pattern = { "*.md" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})
