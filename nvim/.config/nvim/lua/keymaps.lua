local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<F5>", function()
	package.loaded["moq-swap"] = nil
	require("moq-swap")
end, opts)

-- tabnine chat keymaps
vim.keymap.set("x", "<leader>q", "", { noremap = true, callback = require("tabnine.chat").open })
vim.keymap.set("i", "<leader>q", "", { noremap = true, callback = require("tabnine.chat").open })
vim.keymap.set("n", "<leader>q", "", { noremap = true, callback = require("tabnine.chat").open })

vim.keymap.set("n", "<leader>tr", ":write | edit | TSBufEnable highlight<CR>", opts)
vim.keymap.set("v", "<leader>y", '"+y', opts)
vim.keymap.set("", "<leader>p", '"+p', opts)

vim.keymap.set("n", "<leader>gs", "<CMD>Git<CR>", opts)
vim.keymap.set("n", "<leader>gl", "<CMD>silent! Gclog<CR><C-L>", opts)
vim.keymap.set("n", "<leader>gb", "<CMD>Git blame<CR>", opts)
vim.keymap.set("n", "<leader>gd", "<CMD>Gdiffsplit<CR>", opts)
vim.keymap.set("n", "<leader>gr", "<CMD>Gread<CR>", opts)
vim.keymap.set("n", "<leader>gw", "<CMD>Gwrite<CR>", opts)
vim.keymap.set("n", "<leader>ge", "<CMD>Gedit<CR>", opts)
