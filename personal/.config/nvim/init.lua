require('plugins')
require('lsp_config')
require('settings')
require('keybinds')

vim.api.nvim_create_autocmd("BufReadPost", {
   pattern = { "fugitive://*", "term://*" },
   command = "set bufhidden=delete"
})

