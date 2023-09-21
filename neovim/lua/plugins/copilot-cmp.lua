local status_ok, copilot_cmp = pcall(require, "copilot_cmp")
if not status_ok then
  return
end

copilot_cmp.setup({
  method = "getCompletionsCycling",
  formatters = {
    label = require("copilot_cmp.format").format_label_text,
    insert_text = require("copilot_cmp.format").format_insert_text,
    preview = require("copilot_cmp.format").deindent,
  },
})
