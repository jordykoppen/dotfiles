local opts = {
  Lua = {
    format = {
      enable = true,
      defaultConfig = {
        indent_style = "space",
        indent_size = "2",
      },
    },
    diagnostics = {
      globals = {
        "global",
        "vim",
        "use",
        "describe",
        "it",
        "assert",
        "before_each",
        "after_each",
        "require",
        "float",
        "settings",
        "use",
      },
      neededFileStatus = {
        ["codestyle-check"] = "Any",
      },
    },
    completion = {
      showWord = "Disable",
      callSnippet = "Disable",
      keywordSnippet = "Disable",
    },
    workspace = {
      checkThirdParty = false,
      library = {
        ["${3rd}/love2d/library"] = true,
      },
    },
  },
}

local M = {}
M.setup = function(on_attach, capabilities)
  local luadev = require("lua-dev").setup({
    lspconfig = {
      on_attach = on_attach,
      settings = opts,
      flags = {
        debounce_text_changes = 150,
      },
      capabilities = capabilities,
    },
  })

  require("lspconfig").sumneko_lua.setup(luadev)
end

return M
