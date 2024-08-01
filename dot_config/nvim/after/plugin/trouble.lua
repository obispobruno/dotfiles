local nmap = require('core.keymap').nmap

nmap('<leader>t', '<cmd>lua require("trouble").toggle()<cr>')
