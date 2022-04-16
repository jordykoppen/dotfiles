local u = require('config.utils')
local api = vim.api

local ts_utils_settings = {
  -- debug = true,
  import_all_scan_buffers = 100,
  update_imports_on_move = true,
  filter_out_diagnostics_by_code = { 80001 }
}

-- const myString = "hello ${}" ->
-- const myString = `hello ${}`
local change_template_string_quotes = function()
    local row, col = unpack(api.nvim_win_get_cursor(0))
    row = row - 1

    local quote_start, quote_end
    u.gfind(api.nvim_get_current_line(), "[\"']", function(pos)
        if not quote_start then
            -- start at first quote
            quote_start = pos
        elseif pos < col then
            -- move start if quote is closer to col
            if (pos - col) > (quote_start - col) then
                quote_start = pos
            end
        elseif not quote_end then
            -- first quote after col is end
            quote_end = pos
        end
    end)

    -- if found, replace quotes with backticks
    if quote_start and quote_start <= col and quote_end then
        api.nvim_buf_set_text(0, row, quote_start - 1, row, quote_start, { "`" })
        api.nvim_buf_set_text(0, row, quote_end - 1, row, quote_end, { "`" })
    end

    -- input and move cursor into pair
    u.input("${}", "n")
    u.input("<Left>")
end

local M = {
  setup = function(on_attach, capabilities)
    -- local lspconfig = require("lspconfig")
    local ts_utils = require("nvim-lsp-ts-utils")

    require('typescript').setup({
      server = {
        on_attach = function(client, bufnr)
          u.buf_map(bufnr, "n", "gs", ":TypescriptRemoveUnused<CR>")
          u.buf_map(bufnr, "n", "gS", ":TypescriptOrganizeImports<CR>")
          u.buf_map(bufnr, "n", "go", ":TypescriptAddMissingImports<CR>")
          u.buf_map(bufnr, "n", "gA", ":TypescriptFixAll<CR>")
          u.buf_map(bufnr, "n", "gI", ":TypescriptRenameFile<CR>")
          u.buf_map(bufnr, "i", "${", change_template_string_quotes, { nowait = true })

          -- api.nvim_buf_create_user_command(bufnr, "CssToJs", css_to_js, { range = true })
          u.buf_map(bufnr, "n", "gx", ":set opfunc=v:lua.css_to_js<CR>g@")
          u.buf_map(bufnr, "n", "gxx", ":CssToJs<CR>")
          u.buf_map(bufnr, "v", "gx", ":CssToJs<CR>")

          on_attach(client, bufnr)

          ts_utils.setup(ts_utils_settings)
          ts_utils.setup(client)
        end,


        capabilities = capabilities
      }
    })
    -- return { 
    --   root_dir = lspconfig.util.root_pattern("package.json"),
    --   init_options = ts_utils.init_options,
    --   capabilities = capabilities,
    --   on_attach = function(client, bufnr)
    --     client.resolved_capabilities.document_formatting = false
    --
    --     on_attach(client, bufnr)
    --
    --     ts_utils.setup(ts_utils_settings)
    --     ts_utils.setup_client(client)
    --
    --     u.nmap("gs", ":TSLspOrganize<CR>")
    --     u.nmap("gI", ":TSLspRenameFile<CR>")
    --     u.nmap("go", ":TSLspImportAll<CR>")
    --     u.imap("${", change_template_string_quotes, { nowait = true })
    --   end,
    -- }
  end
}

return M
