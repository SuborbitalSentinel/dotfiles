local opts = { noremap=true, silent=true }
local set = vim.keymap.set

set('n', '<leader>gs', ':Git<CR>', opts)
set('n', '<leader>gl', ':silent! Glog<CR><C-L>', opts)
set('n', '<leader>gb', ':Git blame<CR>', opts)
set('n', '<leader>gd', ':Gdiff<CR>', opts)
set('n', '<leader>gr', ':Gread<CR>', opts)
set('n', '<leader>gw', ':Gwrite<CR>', opts)
set('n', '<leader>ge', ':Gedit<CR>', opts)
