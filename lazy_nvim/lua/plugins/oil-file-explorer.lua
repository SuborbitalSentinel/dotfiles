return {
  "stevearc/oil.nvim",
  lazy = false,
  keys = {
    {
      "-",
      "<CMD>Oil<CR>",
      desc = "Browse files using oil.nvim",
    },
  },
  config = function()
    require("oil").setup({
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
    })
  end,
}
