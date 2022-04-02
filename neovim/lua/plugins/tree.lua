local u = require('config.utils')

u.nmap('<C-n>', ':NvimTreeFindFileToggle<CR>', { silent = true })

local tree = require('nvim-tree')

-- each of these options are document at :help nvim-tree.OPTION_NAME
tree.setup({
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = {
    'startify',
    'dashboard',
    'alpha',
  },
  update_to_buf_dir = {
    enable = true,
    auto_open = true
  },
  auto_close = true,
  open_on_tab = true,
  hijack_cursor = true,

  git = {
    enable = true,
    timeout = 500,
    ignore = false,
  },
  filters = {
    dotfiles = false,
    custom = { ".DS_Store" }
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = true,
    side = 'left',
  },
  actions = {
    open_file = {
      quit_on_open = true
    }
  }
})
