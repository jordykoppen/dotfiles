local u = require('config.utils')
local cmp = require('cmp')
local luasnip = require('luasnip')

local api = vim.api

cmp.setup({
  completion = {
    completeopt = 'menuone,noinsert',
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  mapping = {
    ["<C-Space>"] = cmp.mapping({ i = cmp.mapping.complete() }),
    ["<C-e>"] = cmp.mapping({ i = cmp.mapping.abort() }),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_next_item()
        else
            fallback()
        end
    end, {
        "i",
        "s",
    }),
  },
  sources = {
    { name = "luasnip", priority = 9999 },
    { name = "nvim_lsp" },
    { name = "path" },
    {
      name = "buffer",
      option = {
        -- complete from visible buffers
        get_bufnrs = function()
          local bufs = {}
          for _, win in ipairs(api.nvim_list_wins()) do
              bufs[api.nvim_win_get_buf(win)] = true
          end
          return vim.tbl_keys(bufs)
        end,
      },
    },
  },
})

u.imap("<C-j>", function()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  elseif require("neogen").jumpable() then
    u.input("<cmd>lua require'neogen'.jump_next()<CR>")
  end
end)

u.imap("<C-k>", function()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  elseif require("neogen").jumpable() then
    u.input("<cmd>lua require'neogen'.jump_prev()<CR>")
  end
end)
