local u = require("config.utils")
local cmp = require("cmp")
local luasnip = require("luasnip")

local api = vim.api

---checks if the character preceding the cursor is a space character
---@return boolean true if it is a space character, false otherwise
local check_backspace = function()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

local function T(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

---wraps vim.fn.feedkeys while replacing key codes with escape codes
---Ex: feedkeys("<CR>", "n") becomes feedkeys("^M", "n")
---@param key string
---@param mode string
local function feedkeys(key, mode)
  vim.fn.feedkeys(T(key), mode)
end

---when inside a snippet, seeks to the nearest luasnip field if possible, and checks if it is jumpable
---@param dir number 1 for forward, -1 for backward; defaults to 1
---@return boolean true if a jumpable luasnip field is found while inside a snippet
local function jumpable(dir)
  local luasnip_ok, luasnip = pcall(require, "luasnip")
  if not luasnip_ok then
    return
  end

  local win_get_cursor = vim.api.nvim_win_get_cursor
  local get_current_buf = vim.api.nvim_get_current_buf

  local function inside_snippet()
    -- for outdated versions of luasnip
    if not luasnip.session.current_nodes then
      return false
    end

    local node = luasnip.session.current_nodes[get_current_buf()]
    if not node then
      return false
    end

    local snip_begin_pos, snip_end_pos = node.parent.snippet.mark:pos_begin_end()
    local pos = win_get_cursor(0)
    pos[1] = pos[1] - 1 -- LuaSnip is 0-based not 1-based like nvim for rows
    return pos[1] >= snip_begin_pos[1] and pos[1] <= snip_end_pos[1]
  end

  ---sets the current buffer's luasnip to the one nearest the cursor
  ---@return boolean true if a node is found, false otherwise
  local function seek_luasnip_cursor_node()
    -- for outdated versions of luasnip
    if not luasnip.session.current_nodes then
      return false
    end

    local pos = win_get_cursor(0)
    pos[1] = pos[1] - 1
    local node = luasnip.session.current_nodes[get_current_buf()]
    if not node then
      return false
    end

    local snippet = node.parent.snippet
    local exit_node = snippet.insert_nodes[0]

    -- exit early if we're past the exit node
    if exit_node then
      local exit_pos_end = exit_node.mark:pos_end()
      if (pos[1] > exit_pos_end[1]) or (pos[1] == exit_pos_end[1] and pos[2] > exit_pos_end[2]) then
        snippet:remove_from_jumplist()
        luasnip.session.current_nodes[get_current_buf()] = nil

        return false
      end
    end

    node = snippet.inner_first:jump_into(1, true)
    while node ~= nil and node.next ~= nil and node ~= snippet do
      local n_next = node.next
      local next_pos = n_next and n_next.mark:pos_begin()
      local candidate = n_next ~= snippet and next_pos and (pos[1] < next_pos[1])
        or (pos[1] == next_pos[1] and pos[2] < next_pos[2])

      -- Past unmarked exit node, exit early
      if n_next == nil or n_next == snippet.next then
        snippet:remove_from_jumplist()
        luasnip.session.current_nodes[get_current_buf()] = nil

        return false
      end

      if candidate then
        luasnip.session.current_nodes[get_current_buf()] = node
        return true
      end

      local ok
      ok, node = pcall(node.jump_from, node, 1, true) -- no_move until last stop
      if not ok then
        snippet:remove_from_jumplist()
        luasnip.session.current_nodes[get_current_buf()] = nil

        return false
      end
    end

    -- No candidate, but have an exit node
    if exit_node then
      -- to jump to the exit node, seek to snippet
      luasnip.session.current_nodes[get_current_buf()] = snippet
      return true
    end

    -- No exit node, exit from snippet
    snippet:remove_from_jumplist()
    luasnip.session.current_nodes[get_current_buf()] = nil
    return false
  end

  if dir == -1 then
    return inside_snippet() and luasnip.jumpable(-1)
  else
    return inside_snippet() and seek_luasnip_cursor_node() and luasnip.jumpable()
  end
end

local formatting = {
  fields = { "kind", "abbr", "menu" },
  max_width = 0,
  kind_icons = {
    Class = " ",
    Color = " ",
    Constant = "ﲀ ",
    Constructor = " ",
    Enum = "練",
    EnumMember = " ",
    Event = " ",
    Field = " ",
    File = "",
    Folder = " ",
    Function = " ",
    Interface = "ﰮ ",
    Keyword = " ",
    Method = " ",
    Module = " ",
    Operator = "",
    Property = " ",
    Reference = " ",
    Snippet = " ",
    Struct = " ",
    Text = " ",
    TypeParameter = " ",
    Unit = "塞",
    Value = " ",
    Variable = " ",
  },
  source_names = {
    nvim_lsp = "(LSP)",
    emoji = "(Emoji)",
    path = "(Path)",
    calc = "(Calc)",
    cmp_tabnine = "(Tabnine)",
    vsnip = "(Snippet)",
    luasnip = "(Snippet)",
    buffer = "(Buffer)",
  },
  duplicates = {
    buffer = 1,
    path = 1,
    nvim_lsp = 0,
    luasnip = 1,
  },
  duplicates_default = 0,
}

cmp.setup({
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  completion = {
    -- completeopt = 'menuone,noinsert',
    keyword_length = 1,
  },
  -- enabled = function()
  --   -- disable completion in comments
  --   local context = require 'cmp.config.context'
  --   -- keep command mode completion enabled when cursor is in a comment
  --   if vim.api.nvim_get_mode().mode == 'c' then
  --     return true
  --   else
  --     return not context.in_treesitter_capture("comment")
  --       and not context.in_syntax_group("Comment")
  --   end
  -- end,
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<C-Space>"] = cmp.mapping({ i = cmp.mapping.complete(_) }),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    -- TODO: potentially fix emmet nonsense
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif jumpable() then
        luasnip.jump(1)
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping(function(fallback)
      if cmp.visible() and cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }) then
        if jumpable() then
          luasnip.jump(1)
        end
        return
      end

      if jumpable() then
        if not luasnip.jump(1) then
          fallback()
        end
      else
        fallback()
      end
    end),
  },
  formatting = {
    fields = formatting.fields,
    max_width = formatting.max_width,
    kind_icons = formatting.kind_icons,
    source_names = formatting.source_names,
    duplicates = formatting.duplicates,
    duplicates_default = formatting.duplicates_default,
    format = function(entry, vim_item)
      local max_width = formatting.max_width

      if max_width ~= 0 and #vim_item.abbr > max_width then
        vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 1) .. "…"
      end

      vim_item.kind = formatting.kind_icons[vim_item.kind]
      vim_item.menu = formatting.source_names[entry.source.name]
      vim_item.dup = formatting.duplicates[entry.source.name] or formatting.duplicates_default
      return vim_item
    end,
  },
  expiremental = {
    ghost_text = true,
    native_menu = false,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "luasnip" },
    { name = "nvim_lua" },
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
    { name = "calc" },
    { name = "treesitter" },
    { name = "emoji" },
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
