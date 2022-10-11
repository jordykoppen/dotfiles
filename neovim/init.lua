local u = require("config.utils")

local g = {
  mapleader = " ",
  maplocalleader = ";",
}

local opt = {
  backup = false, -- creates backup file
  -- clipboard = 'unnamedplus', -- global (icl system) clipboard
  cmdheight = 2, -- more spaces in the neovim commandline
  colorcolumn = "99999", -- fixes indentline for now?
  conceallevel = 0, -- so that `` is visible in markdown
  cursorline = true, -- highlight current line
  fileencoding = "utf-8", -- encoding for files
  foldmethod = "manual", -- folding set to 'expr' for treesitter based folding
  foldexpr = "", -- set to 'nvim_treesitter#foldexpr()' for treesitter based folding
  guifont = "monospaced:h17", -- font and size for neovim gui apps
  hidden = true, -- to keep multiple buffers and open multi buffers
  hlsearch = false, -- highlight all matches on previous search pattern
  ignorecase = true, -- ignore case in search patterns
  mouse = "a", -- a: Enable mouse for all vim modes: visual, normal, inset, command
  pumheight = 10, -- popup menu height
  showmode = false, -- we don't want to see modes likes INSERT etc
  smartcase = true, -- override the 'ignorecase' option if term contains uppercase characters
  splitbelow = true, -- force all splits to go below current window
  splitright = true, -- force all splits to go next of current window
  swapfile = false, -- you know what this means
  termguicolors = false, -- set term gui colors
  timeoutlen = 500, -- time to wait for a mapped sequence to complete (ms)
  title = true, -- set the title of the window to 'titlestring'
  titlestring = "%<%F=%l/%L - nvim", -- title window format
  undodir = vim.fn.stdpath("cache") .. "/undo",
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
  signcolumn = "yes", -- always show the sign column to prevent shift
  wrap = false,
  spell = false, -- disables spellchecking
  spelllang = "en", -- spellcheck language
  scrolloff = 8, -- minimal lines to keep above and below cursor
  sidescrolloff = 8, -- same as above but sides
}

for k, v in pairs(opt) do
  vim.opt[k] = v
end
for k, v in pairs(g) do
  vim.g[k] = v
end

vim.opt.clipboard:append("unnamedplus")
vim.opt.shortmess:append("cA")

-- initialize global config object
global = {}

-- keymaps

-- NORMAL MODE
-- quit everything on double qq
u.nmap("qq", ":qall<CR>")
u.nmap("<S-CR>", ":wqall<CR>")

-- move around splits with Ctrl + hjkl
u.nmap("<C-h>", "<C-w>h")
u.nmap("<C-j>", "<C-w>j")
u.nmap("<C-k>", "<C-w>k")
u.nmap("<C-l>", "<C-w>l")

u.xmap(">", ">gv")
u.xmap("<", "<gv")

-- Jump to previously edited buffer
u.nmap("<BS>", "<C-^>")
-- Clear highlight when hitting escape in normal mode
u.nmap("<Esc>", ":nohl<CR>")

-- Idk what this does
u.imap("<C-Space>", "<C-x><C-n>")
-- Go to end of line in insert
u.imap("<S-Tab>", "<Esc>A")
-- Shift + Enter saves and closes all
u.imap("jj", "<Esc>")

-- Jump to first non-blank charachter on current line
u.nmap("H", "^")
u.omap("H", "^")
u.xmap("H", "^")
-- Jump to next item in this line after or under cursor. items: ([{}])
u.nmap("L", "%")
u.omap("L", "%")
u.xmap("L", "%")
-- u.nmap("<Tab>", "%", { remap = true })
-- u.xmap("<Tab>", "%", { remap = true })
-- u.omap("<Tab>", "%", { remap = true })

-- TAB MANAGEMENT
-- create new tab
u.nmap("<LocalLeader>t", ":tabnew<CR>")
-- create new tab at index
u.nmap("<LocalLeader>T", ":tabedit %<CR>")
-- close current tab
u.nmap("<LocalLeader>x", ":tabclose<CR>")
-- close all tabs but current
u.nmap("<LocalLeader>o", ":tabonly<CR>")

-- Shortcut for typing commands
-- u.nmap('<Space>', ':', { silent = false })
-- u.xmap('<Space>', ':', { silent = false })

-- when going through search results, scroll it to middle of screen.
u.nmap("n", "nzz")
u.nmap("N", "Nzz")

u.nmap("K", "<cmd>lua vim.lsp.buf.hover()<CR>")

local AUTOCOMMANDS = {
  -- higlight yanked text
  'autocmd TextYankPost * silent! lua vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })',
  -- terminals
  -- always start in insert mode
  "autocmd TermOpen & startinsert",
  -- disable line numbers
  "autocmd TermOpen * setlocal number norelativenumber",
  -- supress process exited message
  "autocmd TermClose term://*lazygit execute 'bdelete! ' . expand('<abuf>')",
  -- remove tilde on EOL
  "let &fcs='eob: '",
  -- set transparent background for signcolumn
  "highlight clear SignColumn",
}

-- Map over AUTOCOMMANDS and execute
for _, cmd in pairs(AUTOCOMMANDS) do
  vim.cmd(cmd)
end
-- source remaining config
require("config")
require("plugins")

local notify = require("notify")

-- suppress lspconfig and trouble "no results" messages.
vim.notify = function(msg, ...)
  if msg:match("%[lspconfig%]") or msg:match("no results") then
    return
  end

  notify(msg, ...)
end

require("lsp")
require("theme")
