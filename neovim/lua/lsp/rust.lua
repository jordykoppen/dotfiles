local M = {}

M.setup = function(on_attach, capabilities)
  local opts = {}
  
  require("rust-tools").setup {
    -- The "server" property provided in rust-tools setup function are the
    -- settings rust-tools will provide to lspconfig during init.            -- 
    -- We merge the necessary settings from nvim-lsp-installer (server:get_default_options())
    -- with the user's own settings (opts).
    server = {
      on_attach = on_attach,
      capabilities = capabilities,
    },
  }
end

return M
