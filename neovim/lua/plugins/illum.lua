-- TODO: See why the fuck this doesn't work
local u = require('config.utils')

u.nmap('<M-n>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>')
u.nmap('<M-p>', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>')
