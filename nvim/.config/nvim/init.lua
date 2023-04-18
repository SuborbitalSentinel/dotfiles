require('globals')
require('plugins')
require('settings')
require('keymaps')
require('lsp_config')

vim.api.nvim_create_autocmd("BufReadPost", {
   pattern = { "fugitive://*", "term://*" },
   command = "set bufhidden=delete"
})

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    group = vim.api.nvim_create_augroup("GolangAuGroup", { clear = true }),
    pattern = {"*.go"},
    callback = function()
        vim.opt_local.tabstop = 4
        vim.opt_local.softtabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.expandtab = false
    end
})

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    group = vim.api.nvim_create_augroup("XamlAuGroup", { clear = true }),
    pattern = {"*.xaml", "*.axaml"},
    callback = function()
        vim.cmd[[setfiletype xml]]
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.shiftwidth = 2
    end
})
