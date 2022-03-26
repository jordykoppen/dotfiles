local trouble = require('trouble.providers.telescope')

require('telescope').setup {
  extensions = {
    media_files = {
      filetypes = {"png", "webp", "jpg", "jpeg"},
      find_cmd = "rg"
    }
  },
  defaults = {
    mappings = {
      i = { ['<c-t'] = trouble.open_with_trouble },
      n = { ['<c-t'] = trouble.open_with_trouble },
    }
  }
}
