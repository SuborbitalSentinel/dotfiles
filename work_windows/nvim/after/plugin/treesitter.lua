require('nvim-treesitter.configs').setup {
    ensure_installed = "all",
    ignore_install = {'thrift'},
    highlight = { enable = true, },
    indent = { enable = true }
}
