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
M.buf_command = function(bufnr, name, fn, opts)
  api.nvim_buf_create_user_command(bufnr, name, fn, opts or {})
end

M.gfind = function(str, substr, cb, init)
  init = init or 1
  local start_pos, end_pos = str:find(substr, init)
  if start_pos then
    cb(start_pos, end_pos)
    return M.gfind(str, substr, cb, end_pos + 1)
  end
end

M.table = {
  some = function(tbl, cb)
    for k, v in pairs(tbl) do
      if cb(k, v) then
        return true
      end
    end
    return false
  end,
}

M.t = function(str)
  return api.nvim_replace_termcodes(str, true, true, true)
end

M.input = function(keys, mode)
  api.nvim_feedkeys(M.t(keys), mode or "m", true)
end

M.registerMappings = function(mappings, opts)
  opts = opts or {}

  local conf = {
    mode = opts.mode or "n", -- NORMAL mode
    prefix = opts.prefix or "<leader>",
    buffer = opts.buffer or nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = opts.silets or true, -- use `silent` when creating keymaps
    noremap = opts.noremap or true, -- use `noremap` when creating keymaps
    nowait = opts.nowait or true, -- use `nowait` when creating keymaps
  }

  require("which-key").register(mappings, conf)
end

return M
