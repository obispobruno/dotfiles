local nmap = require('core.keymap').nmap
local tmap = require('core.keymap').tmap

nmap('<A-i>', '<cmd>ToggleTerm direction=float<cr>', 'Toggle terminal')
tmap('<A-i>', '<cmd>ToggleTerm direction=float<cr>', 'Toggle terminal')
