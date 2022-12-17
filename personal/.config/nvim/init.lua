require('plugins')
require('settings')
require('keybinds')
require('lsp_config')

vim.api.nvim_create_autocmd("BufReadPost", {
   pattern = { "fugitive://*", "term://*" },
   command = "set bufhidden=delete"
})

