vim.cmd [[packadd packer.nvim]]

return require('packer').startup({function()
  local config = function(name)
    return string.format("require('plugins.%s')", name)
  end

  local use_with_config = function(path, name)
    use({ path, config = config(name) })
  end
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- telescope
  use_with_config('nvim-telescope/telescope.nvim', 'telescope')
  use 'nvim-telescope/telescope-symbols.nvim'

  use 'simrat39/rust-tools.nvim'

  -- treesitter
  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = config('treesitter'),
    requires = { 'nvim-lua/plenary.nvim' }
  })
  use 'RRethy/nvim-treesitter-textsubjects' -- adds smart text objects
  use 'windwp/nvim-ts-autotag' -- automatically close JSX tags
  use 'RRethy/nvim-treesitter-endwise' -- wisely add end
  -- use 'theHamsta/nvim-treesitter-commonlisp'

  use_with_config('danymat/neogen', 'neogen') -- annotation generator
  use_with_config('lewis6991/gitsigns.nvim', 'gitsigns')

  use 'nvim-treesitter/playground'



  -- LSP + utils
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
  }

  use_with_config('L3MON4D3/LuaSnip', 'luasnip')
  use({
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
    },
    config = config('cmp')
  })

  use("b0o/schemastore.nvim") -- simple access to json-language-server schemae

  use("jose-elias-alvarez/typescript.nvim")

  use 'folke/lua-dev.nvim'

  -- keymap help
  use_with_config('folke/which-key.nvim', 'whichkey')

  -- file/project navigation
  use_with_config('kyazdani42/nvim-tree.lua', 'tree')
  use_with_config('glepnir/dashboard-nvim', 'dashboard')

  -- utils
  use 'nvim-lua/plenary.nvim'
  use_with_config('RRethy/vim-illuminate', 'illum') -- Highlight other uses of cursor word
  use_with_config("ibhagwan/fzf-lua", "fzf") -- better lua version of fzf.vim

  -- themes
  use '~/workspace/moonlight.nvim'
  use "projekt0n/github-nvim-theme"
  use_with_config('kyazdani42/nvim-web-devicons', 'devicons')

  -- comment
  use_with_config("numToStr/Comment.nvim", "comment")
  use 'JoosepAlviste/nvim-ts-context-commentstring' -- make JSX comments actually work

  -- clipboard
  use_with_config('svermeulen/vim-yoink', 'yoink')

  -- motion
  use_with_config('svermeulen/vim-subversive', 'subversive')

  -- notify
  use 'rcarriga/nvim-notify'

  use_with_config('folke/trouble.nvim', 'troubles')
end,
config = {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "single" }
    end,
  },
}
})
