local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', install_path})
end

vim.cmd [[
set guifont=Hack\ NF:h10.5
let g:neovide_cursor_animation_length=0.05
let g:neovide_cursor_trail_length=0.5
]]

require('settings')
require('load_plugins')
require('lsp_config')

vim.api.nvim_create_autocmd("BufReadPost", {
    group = vim.api.nvim_create_augroup("fugitiveAuGroup", { clear = true }),
    pattern = {"fugitive://*", "term://*"},
    command = "set bufhidden=delete"
})

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    group = vim.api.nvim_create_augroup("XamlAuGroup", { clear = true }),
    pattern = {"*.xaml"},
    command = "setfiletype xml"
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
