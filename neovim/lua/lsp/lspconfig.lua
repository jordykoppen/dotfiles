require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "tsserver", "tailwindcss" },
})

---@diagnostic disable-next-line: different-requires
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace",
      },
    },
  },
  capabilities = capabilities,
})

lspconfig.tsserver.setup({
  capabilities = capabilities,
})

require("typescript").setup({
  disable_commands = false, -- prevent the plugin from creating Vim commands
  debug = false, -- enable debug logging for commands
  go_to_source_definition = {
    fallback = true, -- fall back to standard LSP definition on failure
  },
  server = { -- pass options to lspconfig's setup method
    -- on_attach = ...,
    capabilities = capabilities,
  },
})
