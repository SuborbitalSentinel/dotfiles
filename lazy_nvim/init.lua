-- Check if we're in mergetool mode and disable LSP early
local argc = vim.fn.argc()
if argc >= 4 then
  for i = 0, argc - 1 do
    local arg = vim.fn.argv(i)
    if
      type(arg) == "string"
      and (arg:match("LOCAL") or arg:match("REMOTE") or arg:match("MERGED") or arg:match("BASE"))
    then
      vim.g.lazyvim_lsp_enabled = false
      print("Merge mode: LSP disabled")
      return
    end
  end
end

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
