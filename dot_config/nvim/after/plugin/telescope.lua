local nmap = require('core.keymap').nmap
local b = require('telescope.builtin')

-- Mappings
nmap('<leader>sw', b.grep_string, 'Search Word')
nmap('<leader>fd', b.diagnostics, 'Find Diagnostics')
nmap('<leader>rs', b.resume, 'Resume Last Search')
nmap('<leader>ff', b.find_files, 'Find Files')
nmap('<leader>fg', b.git_files, 'Find Git Files')
nmap('<leader>fw', b.live_grep, 'Live Grep')
nmap('<leader>fh', b.help_tags, 'Find Help')
nmap('<leader>f/', b.current_buffer_fuzzy_find, 'Find in Buffer')
nmap('<leader>fb', b.git_branches, 'Find Branches')
nmap('<leader>fc', b.git_commits, 'Find Commits')
nmap('<leader>fS', b.git_stash, 'Find Stash')
nmap('<leader>fs', b.git_status, 'Find Status')
nmap('<leader>fC', b.git_bcommits, 'Find Buffer Commits')
nmap('<leader>fr', b.oldfiles, 'Find Recent Files')
nmap('<leader>fk', b.keymaps, 'Find Keymaps')
nmap('<leader>ft', b.colorscheme, 'Find Colorscheme')

-- Config
require('telescope').setup({
  defaults = {
    sorting_strategy = 'descending',
    layout_config = {
      horizontal = { prompt_position = 'bottom', preview_width = 0.55 },
      vertical = { mirror = false },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
  },
})
