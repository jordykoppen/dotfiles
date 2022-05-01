local u = require("config.utils")

local luasnip = require("luasnip")

luasnip.config.set_config({
  store_selection_keys = "<C-s>",
})

u.imap("<C-e>", function()
  if luasnip.choice_active() then
    luasnip.change_choice()
  else
    u.input("<C-e>", "n")
  end
end)
