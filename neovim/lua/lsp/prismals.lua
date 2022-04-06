local M = {
  setup = function(on_attach, capabilities)
    return {
      on_attach = on_attach,
      capabilities = capabilities
    }
  end
}

return M
