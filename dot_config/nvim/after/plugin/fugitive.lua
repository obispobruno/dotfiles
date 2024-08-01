local nmap = require('core.keymap').nmap

nmap('<leader>ns', '<cmd>Git status<CR>', 'git status')
nmap('<leader>nc', '<cmd>Git commit --all<CR>', 'git commit --all')
nmap('<leader>nA', '<cmd>Git add %<CR>', 'git add current file')
nmap('<leader>na', '<cmd>Git add .<CR>', 'git add .')
nmap('<leader>nP', '<cmd>Git push<CR>', 'git push')
nmap('<leader>np', '<cmd>Git pull<CR>', 'git pull')
nmap('<leader>nd', '<cmd>Git diff<CR>', 'git diff')
nmap('<leader>nD', '<cmd>Git difftool -y<CR>', 'git difftool')
nmap('<leader>no', '<cmd>diffget //2<CR>', 'git diff get left')
nmap('<leader>nt', '<cmd>diffget //3<CR>', 'git diff get right')
