local nmap = require('core.keymap').nmap
local xmap = require('core.keymap').xmap
local tmap = require('core.keymap').tmap

vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local formatAndSave = function()
  vim.lsp.buf.format()
  vim.cmd('w')
end

-- nmap('<leader>e', '<cmd>Explore<cr>', 'Open file explorer')
-- nmap('<leader>o', '<cmd>Lexplore<cr>', 'Open file explorer')

nmap('<leader>w', formatAndSave, 'Format and save buffer')
nmap('<leader>q', '<cmd>qa!<cr>', 'Quit all without saving')
nmap('<C-q>', '<cmd>q!<cr>', 'Quit current buffer without saving')

nmap('n', 'nzzzv', 'Move to next search match and center')
nmap('N', 'nzzzv', 'Move to previous search match and center')
nmap('G', 'Gzzzv', 'Move to end of file and center')
nmap('<C-u>', '<C-u>zz', 'Move half page up and center')
nmap('<C-d>', '<C-d>zz', 'Move half page down and center')

nmap('|', '<cmd>vsplit<cr>', 'Split window vertically')
nmap('\\', '<cmd>split<cr>', 'Split window horizontally')

xmap('<leader>y', '"+y', 'Copy to clipboard')
xmap('<leader>p', '"_dP', 'Paste without overwriting clipboard')
nmap(
  '<leader>s',
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  'Replace word under cursor in buffer'
)

nmap('<esc>', '<cmd>noh<cr>', 'Clear search highlights')

nmap('<leader>,', '<C-^>', 'Go to last buffer')

tmap('<C-n>', '<C-\\><C-n>', 'Exit terminal mode')

nmap('<leader>T', '<cmd>term<cr>', 'Enter terminal mode')
