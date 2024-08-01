local nmap = require('core.keymap').nmap

nmap('<leader>e', '<cmd> NvimTreeToggle <CR>', 'Toggle NvimTree')

require('nvim-tree').setup({
  filters = {
    dotfiles = true,
  },
})
