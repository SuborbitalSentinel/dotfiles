local o = vim.o
local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt

g.loaded_perl_provider=0
g.loaded_python_provider=0
g.loaded_ruby_provider=0

g.mapleader = ","
g.python3_host_prog = vim.fn.system("which python3"):gsub("\n+", "")

o.tags = "./.git/tags;," .. o.tags
opt.listchars = {
    eol = '↲',
    tab = '▸ ',
    trail = '·',
}
opt.list = true

opt.sidescrolloff = 30
opt.colorcolumn = "160"
opt.updatetime = 100
opt.ttimeoutlen = 25
opt.showtabline = 2
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true

opt.autowrite = true
opt.inccommand = "nosplit"
opt.hlsearch = false
opt.hidden = true
opt.wrap = false
opt.showmode = false
opt.swapfile = false

opt.ignorecase = true
opt.smartcase = true
opt.fixendofline = false
opt.splitbelow = true
opt.laststatus = 3
opt.foldcolumn = "auto"

opt.wildmode = "list:longest"
opt.wildignore = opt.wildignore + "tags,obj,packages,.hg,.git,.svn,*.pyc,*.spl,*.o,*.out,*.DS_Store,*.class,*.manifest,*~,#*#,%*"
opt.wildignore = opt.wildignore + "*.jpg,*.jpeg,*.png,*.gif,*.zip"
opt.wildignore = opt.wildignore + "*/node_modules/*"

local hl = function(thing, opts)
    vim.api.nvim_set_hl(0, thing, opts)
end

hl("SignColumn", {
    bg = "none"
})

hl("Normal", {
    bg = "none"
})

if 1 == fn.executable("rg") then
   opt.grepprg = "rg --vimgrep --no-heading"
   opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"
end

cmd('packadd cfilter')
