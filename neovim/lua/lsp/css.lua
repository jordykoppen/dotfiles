local M = {
  setup = function(on_attach, capabilities)
    require('lspconfig').cssls.setup{
      capabilities = capabilities
    }
  end
}

return M
