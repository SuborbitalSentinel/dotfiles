return {
    "stevearc/oil.nvim",
    config = function()
        require("oil").setup({
            skip_confirm_for_simple_edits = true,
        })
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end,
}
