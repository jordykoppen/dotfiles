local u = require("config.utils")
require("lsp.handlers")

local api = vim.api
local lsp = vim.lsp

local preferred_formatting_clients = { "eslint", "prismals" }
local fallback_formatting_client = "null-ls"
local buffer_client_ids = {}

_G.formatting = function(bufnr)
  bufnr = tonumber(bufnr) or api.nvim_get_current_buf()

  local selected_client
  if buffer_client_ids[bufnr] then
    selected_client = lsp.get_client_by_id(buffer_client_ids[bufnr])
  else
    for _, client in pairs(lsp.buf_get_clients(bufnr)) do
      if vim.tbl_contains(preferred_formatting_clients, client.name) then
        selected_client = client
        break
      end

      if client.name == fallback_formatting_client then
        selected_client = client
      end
    end
  end

  if not selected_client then
    return
  end

  buffer_client_ids[bufnr] = selected_client.id

  local params = lsp.util.make_formatting_params({})
  selected_client.request("textDocument/formatting", params, function(err, res)
    if err then
      local err_msg = type(err) == "string" and err or err.message
      vim.notify("global.lsp.formatting: " .. err_msg, vim.log.levels.WARN)
      return
    end

    if not api.nvim_buf_is_loaded(bufnr) or api.nvim_buf_get_option(bufnr, "modified") then
      return
    end

    if res then
      lsp.util.apply_text_edits(res, bufnr, selected_client.offset_encoding or "utf-16")
      api.nvim_buf_call(bufnr, function()
        vim.cmd("silent noautocmd update")
      end)
    end
  end, bufnr)
end

local on_attach = function(client, bufnr)
  -- commands
  u.command("LspFormatting", vim.lsp.buf.formatting)
  u.command("LspHover", vim.lsp.buf.hover)
  u.command("LspDiagPrev", vim.diagnostic.goto_prev)
  u.command("LspDiagNext", vim.diagnostic.goto_next)
  u.command("LspDiagLine", vim.diagnostic.open_float)
  u.command("LspDiagQuickfix", vim.diagnostic.setqflist)
  u.command("LspSignatureHelp", vim.lsp.buf.signature_help)
  u.command("LspTypeDef", vim.lsp.buf.type_definition)
  u.command("LspRangeAct", vim.lsp.buf.range_code_action)
  -- not sure why this is necessary?
  -- u.command("LspRename", function()
  --   vim.lsp.buf.rename(_)
  -- end)

  -- bindings
  u.buf_map(bufnr, "n", "gi", ":LspRename<CR>")
  u.buf_map(bufnr, "n", "K", ":LspHover<CR>")
  u.buf_map(bufnr, "n", "[a", ":LspDiagPrev<CR>")
  u.buf_map(bufnr, "n", "]a", ":LspDiagNext<CR>")
  u.buf_map(bufnr, "n", "<Leader>a", ":LspDiagLine<CR>")
  u.buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>")

  u.buf_map(bufnr, "n", "gy", ":LspRef<CR>")
  u.buf_map(bufnr, "n", "gh", ":LspTypeDef<CR>")
  u.buf_map(bufnr, "n", "gd", ":LspDef<CR>")
  u.buf_map(bufnr, "n", "ga", ":LspAct<CR>")
  u.buf_map(bufnr, "v", "ga", "<Esc><cmd> LspRangeAct<CR>")

  -- On save, run _G.formatting func defined above.
  if client.supports_method("textDocument/formatting") then
    vim.cmd([[
        augroup LspFormatting
            autocmd! * <buffer>
            autocmd BufWritePost <buffer> lua formatting(vim.fn.expand("<abuf>"))
        augroup END
      ]])
  end

  require("lsp_signature").on_attach()
  require("illuminate").on_attach(client)
end

local capabilities = lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

for _, server in ipairs({
  "null-ls",
  "tsserver",
  "sumneko_lua",
  "eslint",
  "tailwindcss",
  "css",
  "prismals",
  "rust",
}) do
  require("lsp." .. server).setup(on_attach, capabilities)
end

u.registerMappings({
  l = {
    name = "LSP",
    a = { "<cmd>lua require('lvim.core.telescope').code_actions()<cr>", "Code Action" },
    d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
    w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
    f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
    j = {
      "<cmd>lua vim.diagnostic.goto_next()<cr>",
      "Next Diagnostic",
    },
    k = {
      "<cmd>lua vim.diagnostic.goto_prev()<cr>",
      "Prev Diagnostic",
    },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    p = {
      name = "Peek",
      d = { "<cmd>lua require('lvim.lsp.peek').Peek('definition')<cr>", "Definition" },
      t = { "<cmd>lua require('lvim.lsp.peek').Peek('typeDefinition')<cr>", "Type Definition" },
      i = { "<cmd>lua require('lvim.lsp.peek').Peek('implementation')<cr>", "Implementation" },
    },
    q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
  },
})
