local function eslint_config_exists()
  local eslintrc = vim.fn.glob(".eslintrc*", 0, 1)

  if not vim.tbl_isempty(eslintrc) then
    return true
  end

  if vim.fn.filereadable("package.json") then
    if vim.fn.json_decode(vim.fn.readfile("package.json"))["eslintConfig"] then
      return true
    end
  end

  return false
end

local M = {
  setup = function(on_attach, capabilities)
    local lspconfig = require('lspconfig')

    lspconfig.eslint.setup({
      -- root_dir = lspconfig.util.root_pattern('.eslintrc', '.eslintrc.js', '.eslintrc.json'),
      root_dir = function ()
        if not eslint_config_exists() then
          return nil
        end
        return vim.fn.getcwd()
      end,

      on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = true
        on_attach(client, bufnr)
      end,

      capabilities = capabilities,
      settings = {
        format = {
          enable = true
        },
      },
      bin = 'eslint_d',
      handlers = {
        -- this error shows up occasionally when formatting
        -- formatting actually works, so this will supress it
        ["window/showMessageRequest"] = function(_, result)
            if result.message:find("ENOENT") then
                return vim.NIL
            end

            return vim.lsp.handlers["window/showMessageRequest"](nil, result)
        end,
      }
    })
  end
}

return M
