local M = {
  signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  },
  virtual_text = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    border = {
      { "┌", "LspFloatWinBorder" },
      { "─", "LspFloatWinBorder" },
      { "┐", "LspFloatWinBorder" },
      { "│", "LspFloatWinBorder" },
      { "┘", "LspFloatWinBorder" },
      { "─", "LspFloatWinBorder" },
      { "└", "LspFloatWinBorder" },
      { "│", "LspFloatWinBorder" },
    },
    focusable = true,
    style = "minimal",
    source = "always",
    header = "",
    prefix = "",
    format = function(d)
      local t = vim.deepcopy(d)
      local code = d.code or (d.user_data and d.user_data.lsp.code)
      if code then
        t.message = string.format("%s [%s]", t.message, code):gsub("1. ", "")
      end
      return t.message
    end,
  },
}

for _, sign in pairs(M.signs) do
  vim.fn.sign_define(sign.name, { text = sign.text, texthl = sign.name, numhl = "" })
end

return M
