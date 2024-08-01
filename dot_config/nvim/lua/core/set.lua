-- Theme
vim.cmd.colorscheme('gruvbox-material')

-- Show line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Show cursor line
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Share clipboard between vim and system
-- vim.o.clipboard = 'unnamedplus'

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Terminal
vim.o.termguicolors = true

-- Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2

-- Scroll offset
vim.opt.scrolloff = 8

-- Disable highlight on search
vim.opt.hlsearch = true

-- Show sign column
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- netrw
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
vim.g.netrw_banner = 1
vim.g.netrw_liststyle = 3
vim.g.netrw_altv = 1
vim.g.netrw_winsize = 20
vim.g.netrw_localrmdir = 'rm -r'

-- Set conceal level to 2
vim.opt.conceallevel = 0

-- Disable folded highlight
-- vim.cmd('highlight Folded guibg=NONE ctermbg=NONE')
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldtext = 'v:lua.vim.treesitter.foldtext()'
