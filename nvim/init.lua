local opt = {
  backup = false, -- creates backup file
  clipboard = 'unnamedplus', -- global (icl system) clipboard
  cmdheight = 2, -- more spaces in the neovim commandline
  colorcolumn = '99999', -- fixes indentline for now?
  conceallevel = 0, -- so that `` is visible in markdown
  cursorline = true, -- highlight current line
  fileencoding = 'utf-8', -- encoding for files
  foldmethod = 'manual', -- folding set to 'expr' for treesitter based folding
  foldexpr = '', -- set to 'nvim_treesitter#foldexpr()' for treesitter based folding
  guifont = 'monospaced:h17', -- font and size for neovim gui apps
  hidden = true, -- to keep multiple buffers and open multi buffers
  hlsearch = false, -- highlight all matches on previous search pattern
  ignorecase = true, -- ignore case in search patterns
  mouse = 'a', -- a: Enable mouse for all vim modes: visual, normal, inset, command
  pumheight = 10, -- popup menu height
  showmode = false, -- we don't want to see modes likes INSERT etc
  smartcase = true, -- override the 'ignorecase' option if term contains uppercase characters
  splitbelow = true, -- force all splits to go below current window
  splitright = true, -- force all splits to go next of current window
  swapfile = false, -- you know what this means
  termguicolors = false, -- set term gui colors
  timeoutlen = 500, -- time to wait for a mapped sequence to complete (ms)
  title = true, -- set the title of the window to 'titlestring'
  titlestring = '%<%F=%l/%L - nvim', -- title window format
  undodir = vim.fn.stdpath('cache') .. '/undo',
  undofile = true, -- enable persistent undo
  updatetime = 300, -- faster completion
  writebackup = false, -- disable edit if file is being edited by other program

  -- indent and line rules
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 2, -- number of spaces for each indentation
  tabstop = 2, -- insert 2 spaces for a tab
  number = true, -- show line numbers
  relativenumber = true, -- use relative line numbers
  numberwidth = 2, -- set number column width to 2 { default 4 },
  signcolumn = 'yes', -- always show the sign column to prevent shift
  wrap = false,
  spell = false, -- disables spellchecking
  spelllang = 'en', -- spellcheck language
  scrolloff = 8, -- minimal lines to keep above and below cursor
  sidescrolloff = 8, -- same as above but sides
}

for k, v in pairs(opt) do
  vim.opt[k] = v
end

--vim.opt.shortmess:append("cA")

-- initialize global config object
-- global = {}

  vim.g.mapleader = ' '
  vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<c-h>', '<C-W>h', { noremap = true })
  vim.api.nvim_set_keymap('n', '<c-j>', '<C-W>j', { noremap = true })
  vim.api.nvim_set_keymap('n', '<c-k>', '<C-W>k', { noremap = true })
  vim.api.nvim_set_keymap('n', '<c-l>', '<C-W>l', { noremap = true })
  vim.api.nvim_set_keymap('n', 'qq', '<cmd>qa<cr>', { noremap = true })

  vim.cmd('highlight clear SignColumn')

  package.path = package.path .. ';' .. vim.fn.expand('$HOME') .. '/.luarocks/share/lua/5.1/?/init.lua;'
  package.path = package.path .. ';' .. vim.fn.expand('$HOME') .. '/.luarocks/share/lua/5.1/?.lua;'

if vim.g.vscode then

else 
  require('config.lazy')
end
