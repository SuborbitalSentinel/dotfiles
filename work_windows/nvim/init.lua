vim.cmd([[

set guifont=Hack\ NF:h10
let g:neovide_cursor_animation_length=0.05
let g:neovide_cursor_trail_length=0.5

let &shell = executable('pwsh') ? 'pwsh' : 'powershell'
let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
set shellquote= shellxquote=
]])

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- local lazypath = "c:\\git\\nvim-data\\lazy\\lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
vim.opt.diffopt:append("linematch:60")

vim.g.loaded_perl_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.python3_host_prog = "~/scoop/shims/python3.exe"
vim.g.mapleader = ","
vim.o.tags = "./.git/tags;," .. vim.o.tags
vim.opt.listchars = {
	eol = "↲",
	lead = "·",
	trail = "·",
	tab = "  ",
	nbsp = "@",
}
vim.opt.list = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.sidescrolloff = 30
vim.opt.colorcolumn = "120"
vim.opt.ttimeoutlen = 25
vim.opt.showtabline = 2
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0
vim.opt.hlsearch = false
vim.opt.wrap = false
vim.opt.showmode = false
vim.opt.swapfile = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.fixendofline = false
vim.opt.splitbelow = true
vim.opt.laststatus = 3
vim.opt.foldcolumn = "auto"
vim.opt.completeopt = "menu,menuone,noselect"

vim.cmd([[packadd cfilter]])

require("lazy").setup("plugins")
require("lsp_config")

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

-- vim.keymap.set("n", "<leader>ws", "<CMD>%s/^\\s\\+$//<CR>", opts)

if 1 == vim.fn.has("win32") and 1 == vim.fn.has("nvim") then
	vim.keymap.set("", "<C-z>", "<nop>", opts)
end

vim.api.nvim_create_autocmd("BufReadPost", {
	group = vim.api.nvim_create_augroup("fugitiveAuGroup", { clear = true }),
	pattern = { "fugitive://*", "term://*" },
	command = "set bufhidden=delete",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	group = vim.api.nvim_create_augroup("XamlAuGroup", { clear = true }),
	pattern = { "*.xaml" },
	callback = function()
		vim.cmd([[setfiletype xml]])
		vim.opt_local.tabstop = 2
	end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	group = vim.api.nvim_create_augroup("CakeAuGroup", { clear = true }),
	pattern = { "*.cake" },
	command = "setfiletype cs",
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("GitAuGroup", { clear = true }),
	pattern = { "gitcommit" },
	callback = function()
		vim.schedule(function()
			require("editorconfig").properties.max_line_length(0, "72")
		end)
	end,
})
