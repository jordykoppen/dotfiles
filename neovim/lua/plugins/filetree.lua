local status_ok, filetree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local gwidth = vim.api.nvim_list_uis()[1].width
local gheight = vim.api.nvim_list_uis()[1].height
local width = 60
local height = 60

filetree.setup({
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  update_cwd = true,
  view = {
    float = {
      enable = true,
      open_win_config = {
        relative = "win",
        border = "rounded",
        width = width,
        height = height,
        row = (gheight - height) * 0.4,
        col = (gwidth - width) * 0.5,
      },
    },
  },
})

vim.keymap.set("n", "<leader>f", "<cmd>:Telescope find_files<cr>")
vim.keymap.set("n", "<leader>n", "<cmd>:NvimTreeToggle<cr>")
vim.keymap.set({ "n", "v" }, "qq", "<cmd>:qa<cr>")
