local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
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

vim.g.loaded_perl_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.mapleader = ","
vim.opt.relativenumber = true
vim.opt.listchars = {
	eol = '↲',
	tab = '▸ ',
	trail = '·',
}
vim.opt.list = false
vim.opt.sidescrolloff = 30
vim.opt.colorcolumn = "160"
vim.opt.updatetime = 100
vim.opt.ttimeoutlen = 25
vim.opt.showtabline = 2
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = false
vim.opt.hlsearch = false
vim.opt.wrap = false
vim.opt.showmode = false
vim.opt.swapfile = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.fixendofline = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.laststatus = 3
vim.opt.foldcolumn = "auto"
vim.opt.termguicolors = true
vim.opt.completeopt = "menu,menuone,noselect"
vim.cmd([[packadd cfilter]])

require("lazy").setup("plugins")
require("lsp_config")

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>tr", ":write | edit | TSBufEnable highlight<CR>", opts)
vim.keymap.set("v", "<leader>y", '"+y', opts)
vim.keymap.set("", "<leader>p", '"+p', opts)

vim.api.nvim_create_autocmd("BufReadPost", {
    group = vim.api.nvim_create_augroup("fugitiveAuGroup", { clear = true }),
	pattern = { "fugitive://*", "term://*" },
	command = "set bufhidden=delete",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	group = vim.api.nvim_create_augroup("GolangAuGroup", { clear = true }),
	pattern = { "*.go" },
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.softtabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.expandtab = false
	end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufEnter" }, {
	group = vim.api.nvim_create_augroup("ComposeAuGroup", { clear = true }),
	pattern = { "compose.yml" },
	callback = function()
		vim.cmd([[setfiletype yaml.docker-compose]])
	end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	group = vim.api.nvim_create_augroup("XamlAuGroup", { clear = true }),
	pattern = { "*.xaml", "*.axaml" },
	callback = function()
		vim.cmd([[setfiletype xml]])
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.shiftwidth = 2
	end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	group = vim.api.nvim_create_augroup("HtmlAuGroup", { clear = true }),
	pattern = { "*.html", "*.gotmpl" },
	callback = function()
		vim.cmd([[setfiletype html]])
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.shiftwidth = 2
	end,
})
