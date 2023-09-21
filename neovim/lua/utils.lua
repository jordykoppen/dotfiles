local M = {}

M.use_with_config = function(plugin, config)
  local use = require('packer').use

  if config then
    use({
      plugin,
      config = require('plugins.' .. config)
    })
  else
    return plugin
  end
end

return M