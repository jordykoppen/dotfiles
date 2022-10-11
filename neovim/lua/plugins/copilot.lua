local u = require('config.utils')

vim.g.copilot_assume_mapped = true
vim.g.copilot_no_tab_map = true
vim.g.copilot_filetypes = {
  ["*"] = false,
  ["javascript"] = true,
  ["typescript"] = true,
  ["typescriptreact"] = true,
  ["javascriptreact"] = true,
  ["json"] = true,
  ["lua"] = false,
  ["rust"] = true,
  ["c"] = true,
  ["c#"] = true,
  ["c++"] = true,
  ["go"] = true,
  ["python"] = true,
}

vim.cmd('imap <silent><script><expr> <C-J> copilot#Accept("<CR>")')
