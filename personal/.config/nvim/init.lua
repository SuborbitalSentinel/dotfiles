local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'

if fn.empty(fn.glob(install_path)) > 0 then
   fn.system({ 'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', install_path })
end

require('settings')
require('load_plugins')
require('lsp_config')

vim.api.nvim_create_autocmd("BufReadPost", {
   pattern = { "fugitive://*", "term://*" },
   command = "set bufhidden=delete"
})

local opts = { noremap = true, silent = true }
local set = vim.keymap.set

set('n', '<leader>tr', ':write | edit | TSBufEnable highlight<CR>', opts)
set('v', '<leader>y', '"+y', opts)
set('', '<leader>p', '"+p', opts)
