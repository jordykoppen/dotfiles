vim.g.moonlight_italic_comments = false
vim.g.moonlight_italic_keywords = false
vim.g.moonlight_italic_functions = false
vim.g.moonlight_contrast = false
vim.g.moonlight_borders = false

require('moonlight').set()

vim.o.termguicolors = true
vim.cmd'colorscheme moonlight'
