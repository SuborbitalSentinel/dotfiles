return {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
        require("rose-pine").setup({
            variant = "moon",
            dark_variant = "moon",
            extend_background_behind_border = true,
        })
        vim.cmd([[ colorscheme rose-pine ]])
    end,
}
