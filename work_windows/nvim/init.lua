vim.cmd [[
set guifont=Hack\ NF:h10.5
let g:neovide_cursor_animation_length=0.05
let g:neovide_cursor_trail_length=0.5

let &shell = executable('pwsh') ? 'pwsh' : 'powershell'
let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
set shellquote= shellxquote=
]]

require('plugins')
require('settings')
require('keymap')
require('lsp_config')

-- WIP: a keybind to remote the current item from the quickfix list
-- vim.api.nvim_create_autocmd("FileType", {
--     group = vim.api.nvim_create_augroup("quickfixAuGroup", { clear = true }),
--     pattern = "qf",
--     callback = function()
--         local opts = { noremap = true, silent = true, buffer = true }
--         vim.keymap.set('n', 'X', "<cmd>exe 'Cfilter! ' .. matchstr(getline('.'), '.{-}ze<bar>')<CR>", opts)
--     end
-- })

vim.api.nvim_create_autocmd("BufReadPost", {
    group = vim.api.nvim_create_augroup("fugitiveAuGroup", { clear = true }),
    pattern = { "fugitive://*", "term://*" },
    command = "set bufhidden=delete"
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    group = vim.api.nvim_create_augroup("XamlAuGroup", { clear = true }),
    pattern = { "*.xaml" },
    callback = function()
        vim.cmd [[setfiletype xml]]
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.shiftwidth = 2
    end
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    group = vim.api.nvim_create_augroup("CakeAuGroup", { clear = true }),
    pattern = { "*.cake" },
    command = "setfiletype cs"
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    group = vim.api.nvim_create_augroup("JenkinsfileAuGroup", { clear = true }),
    pattern = { "Jenkinsfile*" },
    command = "setfiletype groovy"
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    group = vim.api.nvim_create_augroup("DockerfileAuGroup", { clear = true }),
    pattern = { "*.Dockerfile" },
    command = ""
})
