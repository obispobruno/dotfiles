local nmap = require('core.keymap').nmap
local tmap = require('core.keymap').tmap

nmap('<A-i>', '<CMD>lua require("FTerm").toggle()<CR>', 'toggle floating term')
tmap('<A-i>', '<CMD>lua require("FTerm").toggle()<CR>', 'toggle floating term')
