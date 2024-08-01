local nmap = require('core.keymap').nmap

nmap('<leader>mp', '<cmd>MarkdownPreview<cr>', 'Preview Markdown file')

vim.g.mkdp_auto_start = 0
vim.g.mkdp_auto_close = 0
vim.g.mkdp_browser = '/var/lib/flatpak/exports/bin/io.gitlab.librewolf-community'
