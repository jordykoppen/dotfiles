local ctpn = require("catppuccin")

ctpn.setup({
  transparent_background = false,
  term_colors = true,
  styles = {
    comments = { "italic" },
    functions = { "italic" },
    keywords = { "italic" },
    strings = {},
    variables = { "italic" },
  },
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
    lsp_trouble = true,
    cmp = true,
    lsp_saga = false,
    gitgutter = false,
    gitsigns = true,
    telescope = true,
    nvimtree = {
      enabled = true,
      show_root = false,
      transparent_panel = true,
    },
    which_key = true,
    dashboard = true,
    vim_sneak = false,
    bufferline = true,
    markdown = true,
    ts_rainbow = false,
    notify = true,
    telekasten = true,
    symbols_outline = true,
  },
})

-- vim.g.catppuccin_flavour = "latte"
vim.cmd([[colorscheme catppuccin]])
