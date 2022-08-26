vim.cmd [[
set guifont=Hack\ NF:h10.5
let g:neovide_cursor_animation_length=0.05
let g:neovide_cursor_trail_length=0.5
]]

require('plugins')
require('settings')
require('lsp_config')

vim.api.nvim_create_autocmd("BufReadPost", {
    group = vim.api.nvim_create_augroup("fugitiveAuGroup", { clear = true }),
    pattern = {"fugitive://*", "term://*"},
    command = "set bufhidden=delete"
})

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    group = vim.api.nvim_create_augroup("XamlAuGroup", { clear = true }),
    pattern = {"*.xaml"},
    callback = function()
        vim.cmd[[setfiletype xml]]
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.shiftwidth = 2
    end
})

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    group = vim.api.nvim_create_augroup("CakeAuGroup", { clear = true }),
    pattern = {"*.cake"},
    command = "setfiletype cs"
})

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    group = vim.api.nvim_create_augroup("JenkinsfileAuGroup", { clear = true }),
    pattern = {"Jenkinsfile*"},
    command = "setfiletype groovy"
})

local opts = { noremap=true, silent=true }
local set = vim.keymap.set

set('n', '<leader>tr', ':write | edit | TSBufEnable highlight<CR>', opts)
set('v', '<leader>y', '"+y', opts)
set('', '<leader>p', '"+p', opts)

set('n', '<leader>ftw', ':e ++ff=dos | w<CR>', opts)
set('n', '<leader>ftu', ':e ++ff=dos | setlocal ff=unix | w<CR>', opts)
set('n', '<leader>gp', '<CMD>silent %!prettier --stdin-filepath %<CR>', opts)

if 1 == vim.fn.has('win32') and 1 == vim.fn.has('nvim') then
    set('', '<C-z>', '<nop>', opts)
end
