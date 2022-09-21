require("filetype").setup({
  overrides = {
    extensions = {
      -- Set the filetype of *.mdx files to markdown
      mdx = "markdown",
      fish = "fish",
    },
    literal = {
      eslintrc = "json",
      prettierrc = "json",
    },
    complex = {
      -- Set the filetype of any full filename matching the regex to gitconfig
      [".*git/config"] = "gitconfig", -- Included in the plugin
    },
  },
})
