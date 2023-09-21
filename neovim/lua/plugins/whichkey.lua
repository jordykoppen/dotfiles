local status_ok, wk = pcall(require, "which-key")
if not status_ok then
  return
end

wk.setup({})

wk.register({
  f = {
    name = "  File",
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    s = { "<cmd>w<cr>", "Save" },
    b = { "<cmd>Telescope file_browser<cr>", "Browser" }
  },
  l = {
    name = "  LSP",
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>LspInstallInfo<cr>", "Install Info" },
  }
}, { prefix = "<leader>" })
