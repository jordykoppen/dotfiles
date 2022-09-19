-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

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
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/jordykoppen/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/jordykoppen/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/jordykoppen/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/jordykoppen/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/jordykoppen/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
  ["Comment.nvim"] = {
    config = { "require('plugins.comment')" },
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    config = { "require('plugins.luasnip')" },
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["dashboard-nvim"] = {
    config = { "require('plugins.dashboard')" },
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/dashboard-nvim",
    url = "https://github.com/glepnir/dashboard-nvim"
  },
  ["feline.nvim"] = {
    config = { "require('plugins.feline')" },
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/feline.nvim",
    url = "https://github.com/feline-nvim/feline.nvim"
  },
  ["filetype.nvim"] = {
    config = { "require('plugins.filetype')" },
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/filetype.nvim",
    url = "https://github.com/nathom/filetype.nvim"
  },
  ["fzf-lua"] = {
    config = { "require('plugins.fzf')" },
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/fzf-lua",
    url = "https://github.com/ibhagwan/fzf-lua"
  },
  ["gitsigns.nvim"] = {
    config = { "require('plugins.git')" },
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["goto-preview"] = {
    config = { "require('plugins.preview')" },
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/goto-preview",
    url = "https://github.com/rmagatti/goto-preview"
  },
  ["lsp_signature.nvim"] = {
    config = { "require('plugins.codesignatures')" },
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/lua-dev.nvim",
    url = "https://github.com/folke/lua-dev.nvim"
  },
  neogen = {
    config = { "require('plugins.neogen')" },
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/neogen",
    url = "https://github.com/danymat/neogen"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-cmp"] = {
    config = { "require('plugins.cmp')" },
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils",
    url = "https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    config = { "require('plugins.filetree')" },
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "require('plugins.treesitter')" },
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-endwise"] = {
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/nvim-treesitter-endwise",
    url = "https://github.com/RRethy/nvim-treesitter-endwise"
  },
  ["nvim-treesitter-textsubjects"] = {
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textsubjects",
    url = "https://github.com/RRethy/nvim-treesitter-textsubjects"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-tundra"] = {
    config = { "require('plugins.tundra')" },
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/nvim-tundra",
    url = "/Users/jordykoppen/workspace/nvim-tundra"
  },
  ["nvim-web-devicons"] = {
    config = { "require('plugins.devicons')" },
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["schemastore.nvim"] = {
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/schemastore.nvim",
    url = "https://github.com/b0o/schemastore.nvim"
  },
  ["telescope-symbols.nvim"] = {
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/telescope-symbols.nvim",
    url = "https://github.com/nvim-telescope/telescope-symbols.nvim"
  },
  ["telescope.nvim"] = {
    config = { "require('plugins.telescope')" },
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "require('plugins.troubles')" },
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["twilight.nvim"] = {
    config = { "require('plugins.twilight')" },
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  ["typescript.nvim"] = {
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/typescript.nvim",
    url = "https://github.com/jose-elias-alvarez/typescript.nvim"
  },
  ["vim-illuminate"] = {
    config = { "require('plugins.illum')" },
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["vim-subversive"] = {
    config = { "require('plugins.subversive')" },
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/vim-subversive",
    url = "https://github.com/svermeulen/vim-subversive"
  },
  ["vim-yoink"] = {
    config = { "require('plugins.yoink')" },
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/vim-yoink",
    url = "https://github.com/svermeulen/vim-yoink"
  },
  ["which-key.nvim"] = {
    config = { "require('plugins.whichkey')" },
    loaded = true,
    path = "/Users/jordykoppen/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: neogen
time([[Config for neogen]], true)
require('plugins.neogen')
time([[Config for neogen]], false)
-- Config for: feline.nvim
time([[Config for feline.nvim]], true)
require('plugins.feline')
time([[Config for feline.nvim]], false)
-- Config for: filetype.nvim
time([[Config for filetype.nvim]], true)
require('plugins.filetype')
time([[Config for filetype.nvim]], false)
-- Config for: fzf-lua
time([[Config for fzf-lua]], true)
require('plugins.fzf')
time([[Config for fzf-lua]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require('plugins.telescope')
time([[Config for telescope.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
require('plugins.troubles')
time([[Config for trouble.nvim]], false)
-- Config for: twilight.nvim
time([[Config for twilight.nvim]], true)
require('plugins.twilight')
time([[Config for twilight.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require('plugins.treesitter')
time([[Config for nvim-treesitter]], false)
-- Config for: vim-illuminate
time([[Config for vim-illuminate]], true)
require('plugins.illum')
time([[Config for vim-illuminate]], false)
-- Config for: vim-subversive
time([[Config for vim-subversive]], true)
require('plugins.subversive')
time([[Config for vim-subversive]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
require('plugins.comment')
time([[Config for Comment.nvim]], false)
-- Config for: vim-yoink
time([[Config for vim-yoink]], true)
require('plugins.yoink')
time([[Config for vim-yoink]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
require('plugins.luasnip')
time([[Config for LuaSnip]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
require('plugins.cmp')
time([[Config for nvim-cmp]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
require('plugins.whichkey')
time([[Config for which-key.nvim]], false)
-- Config for: nvim-tundra
time([[Config for nvim-tundra]], true)
require('plugins.tundra')
time([[Config for nvim-tundra]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
require('plugins.devicons')
time([[Config for nvim-web-devicons]], false)
-- Config for: goto-preview
time([[Config for goto-preview]], true)
require('plugins.preview')
time([[Config for goto-preview]], false)
-- Config for: lsp_signature.nvim
time([[Config for lsp_signature.nvim]], true)
require('plugins.codesignatures')
time([[Config for lsp_signature.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
require('plugins.filetree')
time([[Config for nvim-tree.lua]], false)
-- Config for: dashboard-nvim
time([[Config for dashboard-nvim]], true)
require('plugins.dashboard')
time([[Config for dashboard-nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
require('plugins.git')
time([[Config for gitsigns.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
