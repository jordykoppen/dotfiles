local d = require("config.diagnostics")
local M = {}

M.setup = function()
  vim.diagnostic.config(d)
end

return M
