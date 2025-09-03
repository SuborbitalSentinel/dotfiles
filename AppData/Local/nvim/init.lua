local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	})
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.mapleader = ","
vim.opt.relativenumber = true
vim.opt.listchars = {
	eol = "↲",
	tab = "▸ ",
	trail = "·",
}
vim.opt.list = false
vim.opt.sidescrolloff = 45
vim.opt.colorcolumn = "100"
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
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.winborder = "rounded"
vim.cmd([[packadd cfilter]])

require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	rocks = {
		enabled = false,
	},
	change_detection = {
		notify = false,
	},
})
vim.diagnostic.config({ virtual_lines = true })

local opts = { noremap = true, silent = true }
vim.keymap.set("v", "<leader>y", '"+y', opts)
vim.keymap.set("", "<leader>p", '"+p', opts)

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
	callback = function() vim.cmd([[setfiletype yaml.docker-compose]]) end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	group = vim.api.nvim_create_augroup("RazorAuGroup", { clear = true }),
	pattern = { "*.razor" },
	callback = function()
		vim.cmd([[setfiletype razor]])
		vim.opt_local.tabstop = 4
		vim.opt_local.softtabstop = 4
		vim.opt_local.shiftwidth = 4
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

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	group = vim.api.nvim_create_augroup("MarkdownAuGroup", { clear = true }),
	pattern = { "*.md" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.shiftwidth = 2
	end,
})
