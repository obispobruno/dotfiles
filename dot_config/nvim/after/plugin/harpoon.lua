local nmap = require('core.keymap').nmap
local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

nmap('<leader>H', mark.add_file, 'Harpoon add file')
nmap('<leader>h', ui.toggle_quick_menu, 'Harpoon quick menu')

nmap('<leader>1', "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", 'Harpoon to 1')
nmap('<leader>2', "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", 'Harpoon to 2')
nmap('<leader>3', "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", 'Harpoon to 3')
nmap('<leader>4', "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", 'Harpoon to 4')
