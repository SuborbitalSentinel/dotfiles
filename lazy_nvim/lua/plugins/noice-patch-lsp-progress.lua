return {
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        progress = {
          enabled = true,
          format = function(progress)
            if not progress.token then
              return nil
            end
            return progress
          end,
        },
      },
    },
  },
}
