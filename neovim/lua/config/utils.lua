local api = vim.api

local get_map_options = function(custom_options)
  local options = { silent = true }
  if custom_options then
    options = vim.tbl_extend("force", options, custom_options)
  end
end

local M = {}

M.map = function(mode, target, source, opts)
  vim.keymap.set(mode, target, source, get_map_options(opts))
end

for _, mode in ipairs({ "n", "o", "i", "x", "t" }) do
  M[mode .. "map"] = function(...)
    M.map(mode, ...)
  end
end

M.buf_map = function(bufnr, mode, target, source, opts)
  opts = opts or {}
  opts.buffer = bufnr

  M.map(mode, target, source, get_map_options(opts))
end

M.command = function(name, fn, opts)
  api.nvim_create_user_command(name, fn, opts or {})
end

M.t = function(str)
  return api.nvim_replace_termcodes(str, true, true, true)
end

M.input = function(keys, mode)
  api.nvim_feedkeys(M.t(keys), mode or "m", true)
end

function Sad(line_nr, from, to, fname)
  vim.cmd(string.format("silent !sed -i '%ss/%s/%s/' %s", line_nr, from, to, fname))
end

M.increaseTerminalPadding = function()
  Sad("07", 0, 20, "~/dotfiles/alacritty/alacritty.yml")
  Sad("08", 0, 20, "~/dotfiles/alacritty/alacritty.yml")
end

M.decreaseTerminalPadding = function()
  Sad("07", 20, 0, "~/dotfiles/alacritty/alacritty.yml")
  Sad("08", 20, 0, "~/dotfiles/alacritty/alacritty.yml")
end

return M
