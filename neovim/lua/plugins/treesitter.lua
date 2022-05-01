local u = require("config.utils")
require("nvim-treesitter.configs").setup({
  ensure_installed = "all",
  ignore_install = { "phpdoc" }, -- phpdoc doesn't work on M1
  highlight = { enable = true },
  additional_vim_regex_highlighting = true,
  -- plugins
  autopairs = { enable = true },
  context_commentstring = {
    enable = true,
    enable_autocmd = true,
  },
  textsubjects = {
    enable = true,
    keymaps = {
      ["."] = "textsubjects-smart",
      [";"] = "textsubjects-container-outer",
    },
  },
  autotag = { enable = true },
  endwise = { enable = true },
  commonlisp = { enable = false },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = "o",
      toggle_hl_groups = "i",
      toggle_injected_languages = "t",
      toggle_anonymous_nodes = "a",
      toggle_language_display = "I",
      focus_language = "f",
      unfocus_language = "F",
      update = "R",
      goto_node = "<cr>",
      show_help = "?",
    },
  },
})

u.registerMappings({
  T = {
    name = "Treesitter",
    i = { ":TSConfigInfo<cr>", "Info" },
  },
})
