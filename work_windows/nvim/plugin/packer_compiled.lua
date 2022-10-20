-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "C:\\Users\\ADAM~1.MIL\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?.lua;C:\\Users\\ADAM~1.MIL\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?\\init.lua;C:\\Users\\ADAM~1.MIL\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?.lua;C:\\Users\\ADAM~1.MIL\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?\\init.lua"
local install_cpath_pattern = "C:\\Users\\ADAM~1.MIL\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\lua\\5.1\\?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["cmp-buffer"] = {
    loaded = true,
    path = "C:\\Users\\adam.miller\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-calc"] = {
    loaded = true,
    path = "C:\\Users\\adam.miller\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-calc",
    url = "https://github.com/hrsh7th/cmp-calc"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "C:\\Users\\adam.miller\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    loaded = true,
    path = "C:\\Users\\adam.miller\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "C:\\Users\\adam.miller\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "C:\\Users\\adam.miller\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n�\4\0\0\t\0\26\0@6\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0015\1\3\0006\2\4\0009\2\5\0029\2\6\2\18\3\2\0'\5\a\0'\6\b\0009\a\t\0\18\b\1\0B\3\5\1\18\3\2\0'\5\a\0'\6\n\0009\a\v\0\18\b\1\0B\3\5\1\18\3\2\0'\5\a\0'\6\f\0'\a\r\0\18\b\1\0B\3\5\1\18\3\2\0'\5\a\0'\6\14\0'\a\15\0\18\b\1\0B\3\5\1\18\3\2\0'\5\a\0'\6\16\0'\a\17\0\18\b\1\0B\3\5\1\18\3\2\0'\5\a\0'\6\18\0'\a\19\0\18\b\1\0B\3\5\1\18\3\2\0'\5\a\0'\6\20\0'\a\21\0\18\b\1\0B\3\5\1\18\3\2\0'\5\a\0'\6\22\0'\a\23\0\18\b\1\0B\3\5\1\18\3\2\0'\5\a\0'\6\24\0'\a\25\0\18\b\1\0B\3\5\1K\0\1\0\19<CMD>Gedit<CR>\15<leader>ge\20<CMD>Gwrite<CR>\15<leader>gw\19<CMD>Gread<CR>\15<leader>gr\24<CMD>Gdiffsplit<CR>\15<leader>gd\23<CMD>Git blame<CR>\15<leader>gb <CMD>silent! Gclog<CR><C-L>\15<leader>gl\17<CMD>Git<CR>\15<leader>gs\14next_hunk\a]c\14prev_hunk\a[c\6n\bset\vkeymap\bvim\1\0\2\fnoremap\2\vsilent\2\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "C:\\Users\\adam.miller\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n�\3\0\0\6\0\25\0!6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0034\4\3\0005\5\v\0>\5\1\4=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\3=\3\19\0025\3\21\0005\4\20\0=\4\b\0035\4\22\0=\4\14\0035\4\23\0=\4\16\3=\3\24\2B\0\2\1K\0\1\0\ftabline\1\2\0\0\ttabs\1\2\0\0\tdiff\1\0\0\1\2\0\0\rfilename\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_x\1\2\0\0\16diagnostics\14lualine_c\1\2\2\0\rfilename\22shortening_target\3F\tpath\3\1\14lualine_b\1\2\0\0\vbranch\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\1\0\3\23section_separators\5\ntheme\15tokyonight\26components_separators\5\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "C:\\Users\\adam.miller\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lualine.nvim",
    url = "https://github.com/hoob3rt/lualine.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "C:\\Users\\adam.miller\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n:\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\19UltiSnips#Anon\afn\bvim�\5\1\0\v\0+\0K6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0026\1\4\0'\3\6\0B\1\2\0029\2\a\0\18\4\2\0009\2\b\2'\5\t\0009\6\n\0015\b\f\0005\t\v\0=\t\r\bB\6\2\0A\2\2\0019\2\14\0005\4\18\0005\5\16\0003\6\15\0=\6\17\5=\5\19\0045\5\23\0009\6\20\0009\6\21\0069\6\22\6B\6\1\2=\6\24\0059\6\20\0009\6\21\0069\6\22\6B\6\1\2=\6\25\5=\5\21\0049\5\26\0009\5\27\0059\5\28\0055\a\30\0009\b\26\0009\b\29\b)\n��B\b\2\2=\b\31\a9\b\26\0009\b\29\b)\n\4\0B\b\2\2=\b \a9\b\26\0009\b!\b5\n\"\0B\b\2\2=\b#\aB\5\2\2=\5\26\0044\5\a\0005\6$\0>\6\1\0055\6%\0>\6\2\0055\6&\0>\6\3\0055\6'\0>\6\4\0055\6(\0>\6\5\0055\6)\0>\6\6\5=\5*\4B\2\2\1K\0\1\0\fsources\1\0\1\tname\tcalc\1\0\1\tname\tpath\1\0\1\tname\rnvim_lua\1\0\1\tname\vbuffer\1\0\1\tname\28nvim_lsp_signature_help\1\0\1\tname\rnvim_lsp\t<C-y\1\0\1\vselect\2\fconfirm\n<C-f>\n<C-b>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\18documentation\15completion\1\0\0\rbordered\vwindow\vconfig\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\"nvim-autopairs.completion.cmp\bcmp\frequire\26menu,menuone,noselect\16completeopt\bopt\bvim\0" },
    loaded = true,
    path = "C:\\Users\\adam.miller\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "C:\\Users\\adam.miller\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "C:\\Users\\adam.miller\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\15\0\0\tbash\fc_sharp\fcomment\15dockerfile\ago\njson5\blua\rmarkdown\tnorg\vpython\nregex\ftodotxt\bvim\tyaml\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "C:\\Users\\adam.miller\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "C:\\Users\\adam.miller\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["omnisharp-extended-lsp.nvim"] = {
    loaded = true,
    path = "C:\\Users\\adam.miller\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\omnisharp-extended-lsp.nvim",
    url = "https://github.com/Hoffs/omnisharp-extended-lsp.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "C:\\Users\\adam.miller\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "C:\\Users\\adam.miller\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    config = { "\27LJ\2\nS\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\18gitattributes\radd_file\21plenary.filetype\frequire\0" },
    loaded = true,
    path = "C:\\Users\\adam.miller\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "C:\\Users\\adam.miller\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  tabular = {
    loaded = true,
    path = "C:\\Users\\adam.miller\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\tabular",
    url = "https://github.com/godlygeek/tabular"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "C:\\Users\\adam.miller\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\bcwd\25~/AppData/Local/nvim\17prompt_title\20< NVIM Config >\15find_files\22telescope.builtin\frequire�\a\1\0\n\0,\0]6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\21\0005\4\4\0005\5\5\0=\5\6\0045\5\a\0=\5\b\0045\5\16\0005\6\n\0009\a\t\0=\a\v\0069\a\f\0=\a\r\0069\a\14\0=\a\15\6=\6\17\0055\6\18\0009\a\t\0=\a\v\0069\a\f\0=\a\r\0069\a\14\0=\a\15\6=\6\19\5=\5\20\4=\4\22\3B\1\2\0016\1\0\0'\3\2\0B\1\2\0029\1\23\1'\3\24\0B\1\2\0016\1\0\0'\3\2\0B\1\2\0029\1\23\1'\3\25\0B\1\2\0015\1\26\0006\2\27\0009\2\28\0029\2\29\2\18\3\2\0'\5\19\0'\6\30\0'\a\31\0\18\b\1\0B\3\5\1\18\3\2\0'\5\19\0'\6 \0'\a!\0\18\b\1\0B\3\5\1\18\3\2\0'\5\19\0'\6\"\0'\a#\0\18\b\1\0B\3\5\1\18\3\2\0'\5\19\0'\6$\0'\a%\0\18\b\1\0B\3\5\0013\3&\0\18\4\2\0'\6\19\0'\a'\0\18\b\3\0\18\t\1\0B\4\5\1\18\4\2\0'\6\19\0'\a(\0'\b)\0\18\t\1\0B\4\5\1\18\4\2\0'\6\19\0'\a*\0'\b+\0\18\t\1\0B\4\5\1K\0\1\0!<cmd>Telescope help_tags<cr>\15<leader>ht\"<cmd>Telescope workspaces<cr>\15<leader>wp\16<leader>vrc\0!<cmd>Telescope live_grep<cr>\n<c-g>\31<cmd>Telescope buffers<cr>\n<c-b>!<cmd>Telescope git_files<cr>\n<c-p>\"<cmd>Telescope find_files<cr>\n<c-f>\bset\vkeymap\bvim\1\0\2\fnoremap\2\vsilent\2\15workspaces\bfzf\19load_extension\rdefaults\1\0\0\rmappings\6n\1\0\0\6i\1\0\0\n<C-d>\18delete_buffer\n<C-w>\19send_to_qflist\n<C-q>\1\0\0\28send_selected_to_qflist\25file_ignore_patterns\1\v\0\0\n%.dll\v%.docx\n%.dwg\n%.dxe\n%.exe\n%.pdf\n%.ttf\n%.xls\25^ExternalAssemblies/\f^tools/\17path_display\1\2\0\0\rtruncate\1\0\1\20layout_strategy\rvertical\nsetup\14telescope\22telescope.actions\frequire\0" },
    loaded = true,
    path = "C:\\Users\\adam.miller\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "C:\\Users\\adam.miller\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ultisnips = {
    config = { "\27LJ\2\n=\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\rvertical\23UltiSnipsEditSplit\6g\bvim\0" },
    loaded = true,
    path = "C:\\Users\\adam.miller\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\ultisnips",
    url = "https://github.com/SirVer/ultisnips"
  },
  ["vim-bbye"] = {
    loaded = true,
    path = "C:\\Users\\adam.miller\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-bbye",
    url = "https://github.com/moll/vim-bbye"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "C:\\Users\\adam.miller\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "C:\\Users\\adam.miller\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-eunuch",
    url = "https://github.com/tpope/vim-eunuch"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "C:\\Users\\adam.miller\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "C:\\Users\\adam.miller\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "C:\\Users\\adam.miller\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-symlink"] = {
    loaded = true,
    path = "C:\\Users\\adam.miller\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-symlink",
    url = "https://github.com/aymericbeaumet/vim-symlink"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "C:\\Users\\adam.miller\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["vim-vinegar"] = {
    loaded = true,
    path = "C:\\Users\\adam.miller\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-vinegar",
    url = "https://github.com/tpope/vim-vinegar"
  },
  ["workspaces.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15workspaces\frequire\0" },
    loaded = true,
    path = "C:\\Users\\adam.miller\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\workspaces.nvim",
    url = "https://github.com/natecraddock/workspaces.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: ultisnips
time([[Config for ultisnips]], true)
try_loadstring("\27LJ\2\n=\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\rvertical\23UltiSnipsEditSplit\6g\bvim\0", "config", "ultisnips")
time([[Config for ultisnips]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n:\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\19UltiSnips#Anon\afn\bvim�\5\1\0\v\0+\0K6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0026\1\4\0'\3\6\0B\1\2\0029\2\a\0\18\4\2\0009\2\b\2'\5\t\0009\6\n\0015\b\f\0005\t\v\0=\t\r\bB\6\2\0A\2\2\0019\2\14\0005\4\18\0005\5\16\0003\6\15\0=\6\17\5=\5\19\0045\5\23\0009\6\20\0009\6\21\0069\6\22\6B\6\1\2=\6\24\0059\6\20\0009\6\21\0069\6\22\6B\6\1\2=\6\25\5=\5\21\0049\5\26\0009\5\27\0059\5\28\0055\a\30\0009\b\26\0009\b\29\b)\n��B\b\2\2=\b\31\a9\b\26\0009\b\29\b)\n\4\0B\b\2\2=\b \a9\b\26\0009\b!\b5\n\"\0B\b\2\2=\b#\aB\5\2\2=\5\26\0044\5\a\0005\6$\0>\6\1\0055\6%\0>\6\2\0055\6&\0>\6\3\0055\6'\0>\6\4\0055\6(\0>\6\5\0055\6)\0>\6\6\5=\5*\4B\2\2\1K\0\1\0\fsources\1\0\1\tname\tcalc\1\0\1\tname\tpath\1\0\1\tname\rnvim_lua\1\0\1\tname\vbuffer\1\0\1\tname\28nvim_lsp_signature_help\1\0\1\tname\rnvim_lsp\t<C-y\1\0\1\vselect\2\fconfirm\n<C-f>\n<C-b>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\18documentation\15completion\1\0\0\rbordered\vwindow\vconfig\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\"nvim-autopairs.completion.cmp\bcmp\frequire\26menu,menuone,noselect\16completeopt\bopt\bvim\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\bcwd\25~/AppData/Local/nvim\17prompt_title\20< NVIM Config >\15find_files\22telescope.builtin\frequire�\a\1\0\n\0,\0]6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\21\0005\4\4\0005\5\5\0=\5\6\0045\5\a\0=\5\b\0045\5\16\0005\6\n\0009\a\t\0=\a\v\0069\a\f\0=\a\r\0069\a\14\0=\a\15\6=\6\17\0055\6\18\0009\a\t\0=\a\v\0069\a\f\0=\a\r\0069\a\14\0=\a\15\6=\6\19\5=\5\20\4=\4\22\3B\1\2\0016\1\0\0'\3\2\0B\1\2\0029\1\23\1'\3\24\0B\1\2\0016\1\0\0'\3\2\0B\1\2\0029\1\23\1'\3\25\0B\1\2\0015\1\26\0006\2\27\0009\2\28\0029\2\29\2\18\3\2\0'\5\19\0'\6\30\0'\a\31\0\18\b\1\0B\3\5\1\18\3\2\0'\5\19\0'\6 \0'\a!\0\18\b\1\0B\3\5\1\18\3\2\0'\5\19\0'\6\"\0'\a#\0\18\b\1\0B\3\5\1\18\3\2\0'\5\19\0'\6$\0'\a%\0\18\b\1\0B\3\5\0013\3&\0\18\4\2\0'\6\19\0'\a'\0\18\b\3\0\18\t\1\0B\4\5\1\18\4\2\0'\6\19\0'\a(\0'\b)\0\18\t\1\0B\4\5\1\18\4\2\0'\6\19\0'\a*\0'\b+\0\18\t\1\0B\4\5\1K\0\1\0!<cmd>Telescope help_tags<cr>\15<leader>ht\"<cmd>Telescope workspaces<cr>\15<leader>wp\16<leader>vrc\0!<cmd>Telescope live_grep<cr>\n<c-g>\31<cmd>Telescope buffers<cr>\n<c-b>!<cmd>Telescope git_files<cr>\n<c-p>\"<cmd>Telescope find_files<cr>\n<c-f>\bset\vkeymap\bvim\1\0\2\fnoremap\2\vsilent\2\15workspaces\bfzf\19load_extension\rdefaults\1\0\0\rmappings\6n\1\0\0\6i\1\0\0\n<C-d>\18delete_buffer\n<C-w>\19send_to_qflist\n<C-q>\1\0\0\28send_selected_to_qflist\25file_ignore_patterns\1\v\0\0\n%.dll\v%.docx\n%.dwg\n%.dxe\n%.exe\n%.pdf\n%.ttf\n%.xls\25^ExternalAssemblies/\f^tools/\17path_display\1\2\0\0\rtruncate\1\0\1\20layout_strategy\rvertical\nsetup\14telescope\22telescope.actions\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n�\4\0\0\t\0\26\0@6\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0015\1\3\0006\2\4\0009\2\5\0029\2\6\2\18\3\2\0'\5\a\0'\6\b\0009\a\t\0\18\b\1\0B\3\5\1\18\3\2\0'\5\a\0'\6\n\0009\a\v\0\18\b\1\0B\3\5\1\18\3\2\0'\5\a\0'\6\f\0'\a\r\0\18\b\1\0B\3\5\1\18\3\2\0'\5\a\0'\6\14\0'\a\15\0\18\b\1\0B\3\5\1\18\3\2\0'\5\a\0'\6\16\0'\a\17\0\18\b\1\0B\3\5\1\18\3\2\0'\5\a\0'\6\18\0'\a\19\0\18\b\1\0B\3\5\1\18\3\2\0'\5\a\0'\6\20\0'\a\21\0\18\b\1\0B\3\5\1\18\3\2\0'\5\a\0'\6\22\0'\a\23\0\18\b\1\0B\3\5\1\18\3\2\0'\5\a\0'\6\24\0'\a\25\0\18\b\1\0B\3\5\1K\0\1\0\19<CMD>Gedit<CR>\15<leader>ge\20<CMD>Gwrite<CR>\15<leader>gw\19<CMD>Gread<CR>\15<leader>gr\24<CMD>Gdiffsplit<CR>\15<leader>gd\23<CMD>Git blame<CR>\15<leader>gb <CMD>silent! Gclog<CR><C-L>\15<leader>gl\17<CMD>Git<CR>\15<leader>gs\14next_hunk\a]c\14prev_hunk\a[c\6n\bset\vkeymap\bvim\1\0\2\fnoremap\2\vsilent\2\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: workspaces.nvim
time([[Config for workspaces.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15workspaces\frequire\0", "config", "workspaces.nvim")
time([[Config for workspaces.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n�\3\0\0\6\0\25\0!6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0034\4\3\0005\5\v\0>\5\1\4=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\3=\3\19\0025\3\21\0005\4\20\0=\4\b\0035\4\22\0=\4\14\0035\4\23\0=\4\16\3=\3\24\2B\0\2\1K\0\1\0\ftabline\1\2\0\0\ttabs\1\2\0\0\tdiff\1\0\0\1\2\0\0\rfilename\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_x\1\2\0\0\16diagnostics\14lualine_c\1\2\2\0\rfilename\22shortening_target\3F\tpath\3\1\14lualine_b\1\2\0\0\vbranch\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\1\0\3\23section_separators\5\ntheme\15tokyonight\26components_separators\5\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: plenary.nvim
time([[Config for plenary.nvim]], true)
try_loadstring("\27LJ\2\nS\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\18gitattributes\radd_file\21plenary.filetype\frequire\0", "config", "plenary.nvim")
time([[Config for plenary.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\15\0\0\tbash\fc_sharp\fcomment\15dockerfile\ago\njson5\blua\rmarkdown\tnorg\vpython\nregex\ftodotxt\bvim\tyaml\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end