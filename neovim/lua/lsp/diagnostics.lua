local M = {}

local border_opts = { border = "single", focusable = false, scope = "line" }

local float = {
    focusable = false,
    style = 'minimal',
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
    format = function(d)
      local t = vim.deepcopy(d)
      local code = d.code or (d.user_data and d.user_data.lsp.code)

      if code then
        t.message = string.format("%s [%s]", t.message, code):gsub("1. ", "")
      end

      return t.message
    end,
}


M.setup = function()
  local signs = {
    { name = 'DiagnosticSignError', text = "", },
    { name = 'DiagnosticSignWarn', text = "", },
    { name = 'DiagnosticSignHint', text = "", },
    { name = 'DiagnosticSignInfo', text = "", },
  }

  for _, sign in pairs(signs) do
    vim.fn.sign_define(sign.name, { text = sign.text, texthl = sign.name, numhl = '' })
  end

  local config = {
    -- inline text
    virtual_text = false,
    -- show signs
    signs = {
      active = signs
    },
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = float,
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border_opts }) 
  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border_opts })
end

function M.show_line_diagnostics()
  local config = float
  config.scope = "line"
  return vim.diagnostic.open_float(0, config)
end

return M
