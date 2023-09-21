local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

  local config = function(name)
    return string.format("require('%s')", name)
  end

  use({
    "L3MON4D3/LuaSnip",
  })

  use({
    "williamboman/mason-lspconfig.nvim",
    requires = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = config("lsp.lspconfig"),
  })

  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = config("plugins.treesitter"),
  })

  use({
    "folke/neodev.nvim",
    config = config("plugins.neodev"),
  })

  use({ "onsails/lspkind.nvim" })

  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = config("plugins.cmp"),
  })

  use({ "jose-elias-alvarez/typescript.nvim" })

  use("projekt0n/github-nvim-theme")

  use({
    "zbirenbaum/copilot.lua",
    config = function()
      require("copilot").setup()
    end,
  })

  use({ "zbirenbaum/copilot-cmp", after = { "copilot.lua", "nvim-cmp" }, config = config("plugins.copilot-cmp") })

  use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" }, config = config("plugins.telescope") })
  use({ "nvim-telescope/telescope-file-browser.nvim" })
  use({ "folke/which-key.nvim", config = config('plugins.whichkey') })

  use({ 
    "nvim-tree/nvim-tree.lua",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = config("plugins.filetree") 
  })

  if packer_bootstrap then
    require("packer").sync()
  end

  vim.cmd([[
    augroup packer_user_config
      autocmd!
      autocmd BufWritePost plugins.lua source <afile>
    augroup end
  ]])
end)
