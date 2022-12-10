local u = require("config.utils")
local Terminal = require("toggleterm.terminal").Terminal;
local powerlab = Terminal:new({ cmd = "ssh powerlab", hidden = true })
local homelab = Terminal:new({ cmd = "ssh homelab", hidden = true })

local function terminal_toggle(terminal)
  terminal:toggle()
end

require("toggleterm").setup({
  persist_mode = true,
  close_on_exit = true,
  direction = 'float',
})

u.registerMappings({
  t = {
    name = "ToggleTerm",
    h = { function() terminal_toggle(homelab) end, "SSH Homelab" },
    p = { function() terminal_toggle(powerlab) end, "SSH Powerlab" },
  },
})
