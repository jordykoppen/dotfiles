-- vim.g.dashboard_preview_command = "bat"
-- vim.g.dashboard_default_executive = "telescope"

local home = os.getenv("HOME")
local db = require("dashboard")

db.preview_command = "cat | lolcat -F 0.1 --seed=12 -a --speed=200"
db.preview_file_path = home .. "/.config/nvim/static/neovim.cat"
db.preview_file_height = 6
db.preview_file_width = 64

db.custom_center = {
  {
    icon = "  ",
    desc = "Recently latest session                  ",
    action = "SessionLoad",
  },
  {
    icon = "  ",
    desc = "Recently opened files                   ",
    action = "Telescope oldfiles find_command=rg,--hidden,--files",
  },
  {
    icon = "  ",
    desc = "Find  File                              ",
    action = "Telescope find_files find_command=rg,--hidden,--files",
  },
  {
    icon = "  ",
    desc = "File Browser                            ",
    action = "Telescope file_browser",
  },
  {
    icon = "  ",
    desc = "Find  word                              ",
    action = "Telescope live_grep",
  },
  {
    icon = "  ",
    desc = "Open Personal dotfiles                  ",
    action = "Telescope find_files path=" .. home .. "/dotfiles",
  },
}
