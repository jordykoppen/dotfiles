local null_ls = require('null-ls')
local b = null_ls.builtins

local diagnostics_template = '#{m} [#{c}]'

local with_root_file = function(builtin, file)
  return builtin.with({
    condition = function(utils)
      return utils.root_has_file(file)
    end,
  })
end

local sources = {
  -- formatting
  b.formatting.stylua,
  b.formatting.prettier,
  b.formatting.stylua,
  -- b.formatting.stylua.with({
  --   condition = with_root_file('stylua.toml')
  -- }),

  -- diagnostics
  -- b.diagnostics.tsc,

  -- code actions
  b.code_actions.eslint,
  b.code_actions.gitsigns,

  -- hover
  b.hover.dictionary
}

local M = {}

M.setup = function(on_attach)
  null_ls.setup({
    -- debug = true,
    sources = sources,
    on_attach = function(client, bufnr)
      client.resolved_capabilities.document_formatting = false
      on_attach(client, bufnr)
    end,
  })
end

return M
