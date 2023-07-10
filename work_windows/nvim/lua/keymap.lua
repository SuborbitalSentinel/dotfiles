local opts = { noremap = true, silent = true }

-- Copy filename to clipboard
vim.keymap.set("n", "<leader>cfg", function()
    vim.fn.setreg("+", vim.fn.expand("%"))
end)

-- keep things in the middle...
vim.keymap.set("n", "[q", "<CMD>:cprevious<CR>zz", opts)
vim.keymap.set("n", "[Q", "<CMD>:cfirst<CR>zz", opts)
vim.keymap.set("n", "]q", "<CMD>:cnext<CR>zz", opts)
vim.keymap.set("n", "]Q", "<CMD>:clast<CR>zz", opts)
vim.keymap.set("n", "n", "nzz", opts)
vim.keymap.set("n", "N", "Nzz", opts)
vim.keymap.set("n", "<c-o>", "<c-o>zz", opts)
vim.keymap.set("n", "<c-i>", "<c-i>zz", opts)

vim.keymap.set("n", "<leader>tr", ":write | edit | TSBufEnable highlight<CR>", opts)
vim.keymap.set("v", "<leader>y", '"+y', opts)
vim.keymap.set("", "<leader>p", '"+p', opts)

vim.keymap.set("n", "<leader>ftw", ":e ++ff=dos | w<CR>", opts)
vim.keymap.set("n", "<leader>ftu", ":e ++ff=dos | setlocal ff=unix | w<CR>", opts)
vim.keymap.set("n", "<c-l>", "<cmd>noh<cr>", opts)

vim.keymap.set("n", "<leader>gs", "<CMD>Git<CR>", opts)
vim.keymap.set("n", "<leader>gl", "<CMD>silent! Gclog<CR><C-L>", opts)
vim.keymap.set("n", "<leader>gb", "<CMD>Git blame<CR>", opts)
vim.keymap.set("n", "<leader>gd", "<CMD>Gdiffsplit<CR>", opts)
vim.keymap.set("n", "<leader>gr", "<CMD>Gread<CR>", opts)
vim.keymap.set("n", "<leader>gw", "<CMD>Gwrite<CR>", opts)
vim.keymap.set("n", "<leader>ge", "<CMD>Gedit<CR>", opts)

if 1 == vim.fn.has("win32") and 1 == vim.fn.has("nvim") then
    vim.keymap.set("", "<C-z>", "<nop>", opts)
end
