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
  b.formatting.eslint_d,
  b.formatting.fish_indent,
  b.formatting.stylua,
  -- b.formatting.stylua.with({
  --   condition = with_root_file('stylua.toml')
  -- }),

  -- diagnostics
  b.diagnostics.eslint_d,

  -- code actions
  b.code_actions.eslint_d,
  b.code_actions.gitsigns,

  -- hover
  b.hover.dictionary
}

local M = {
  setup = function(on_attach)
    return null_ls.setup({
      -- debug = true,
      sources = sources,
      on_attach = on_attach,
    })
  end
}

return M
