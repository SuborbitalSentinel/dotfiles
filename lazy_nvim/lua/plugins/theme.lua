return {

  {
    "eddyekofo94/gruvbox-flat.nvim",
    priority = 1000,
    enabled = true,
    config = function()
      vim.g.gruvbox_flat_style = "hard"
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-flat",
    },
  },
}
