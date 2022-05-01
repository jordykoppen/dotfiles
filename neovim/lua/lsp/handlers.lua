local c = require("config.diagnostics")
local lsp = vim.lsp

lsp.handlers["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, c.float)
lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, c.float)
