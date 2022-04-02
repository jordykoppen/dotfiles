local M = {
  setup = function(on_attach, capabilities)
    require('lspconfig').tailwindcss.setup{}
  end
}

return M
