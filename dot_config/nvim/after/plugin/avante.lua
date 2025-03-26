local nmap = require('core.keymap').nmap

nmap('<leader>al', '<cmd>AvanteClear<cr>', 'Avante clear')

require('avante').setup({
  ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
  provider = 'deepseek-r1',
  auto_suggestions_provider = 'claude',
  cursor_applying_provider = 'groq',
  claude = {
    endpoint = 'https://api.anthropic.com',
    model = 'claude-3-7-sonnet-20250219',
    timeout = 30000,
    temperature = 0,
    max_tokens = 8000,
  },
  vendors = {
    ollama = {
      __inherited_from = 'openai',
      api_key_name = '',
      endpoint = 'http://localhost:11434/v1',
      model = 'deepseek-r1:8b',
    },
    groq = {
      __inherited_from = 'openai',
      api_key_name = 'GROQ_API_KEY',
      endpoint = 'https://api.groq.com/openai/v1/',
      model = 'llama-3.3-70b-versatile',
      max_tokens = 32768,
    },
    deepseek_r1 = {
      __inherited_from = 'openai',
      endpoint = 'https://api.deepseek.com/',
      model = 'deepseek-reasoner',
      api_key_name = 'DEEPSEEK_API_KEY',
      disable_tools = true,
      max_tokens = 8192,
      timeout = 30000,
      temperature = 0,
    },
    deepseek_v3 = {
      __inherited_from = 'openai',
      endpoint = 'https://api.deepseek.com/',
      model = 'deepseek-chat',
      api_key_name = 'DEEPSEEK_API_KEY',
      max_tokens = 8192,
      timeout = 30000,
      temperature = 0,
    },
  },
  behaviour = {
    auto_suggestions = false,
    auto_set_highlight_group = true,
    auto_set_keymaps = true,
    auto_apply_diff_after_generation = true,
    support_paste_from_clipboard = false,
    minimize_diff = true,
    enable_cursor_planning_mode = true,
  },
  mappings = {
    --- @class AvanteConflictMappings
    diff = {
      ours = 'co',
      theirs = 'ct',
      all_theirs = 'ca',
      both = 'cb',
      cursor = 'cc',
      next = ']x',
      prev = '[x',
    },
    suggestion = {
      accept = '<M-l>',
      next = '<M-]>',
      prev = '<M-[>',
      dismiss = '<C-]>',
    },
    jump = {
      next = ']]',
      prev = '[[',
    },
    submit = {
      normal = '<CR>',
      insert = '<C-s>',
    },
    sidebar = {
      apply_all = 'A',
      apply_cursor = 'a',
      switch_windows = '<Tab>',
      reverse_switch_windows = '<S-Tab>',
    },
  },
  hints = { enabled = true },
  windows = {
    ---@type "right" | "left" | "top" | "bottom"
    position = 'right', -- the position of the sidebar
    wrap = true, -- similar to vim.o.wrap
    width = 30, -- default % based on available width
    sidebar_header = {
      enabled = true, -- true, false to enable/disable the header
      align = 'center', -- left, center, right for title
      rounded = true,
    },
    input = {
      prefix = '> ',
      height = 8, -- Height of the input window in vertical layout
    },
    edit = {
      border = 'rounded',
      start_insert = true, -- Start insert mode when opening the edit window
    },
    ask = {
      floating = false, -- Open the 'AvanteAsk' prompt in a floating window
      start_insert = false, -- Start insert mode when opening the ask window
      border = 'rounded',
      ---@type "ours" | "theirs"
      focus_on_apply = 'ours', -- which diff to focus after applying
    },
  },
  highlights = {
    ---@type AvanteConflictHighlights
    diff = {
      current = 'DiffText',
      incoming = 'DiffAdd',
    },
  },
  --- @class AvanteConflictUserConfig
  diff = {
    autojump = true,
    ---@type string | fun(): any
    list_opener = 'copen',
    --- Override the 'timeoutlen' setting while hovering over a diff (see :help timeoutlen).
    --- Helps to avoid entering operator-pending mode with diff mappings starting with `c`.
    --- Disable by setting to -1.
    override_timeoutlen = 500,
  },
  --- @class AvanteFileSelectorConfig
  file_selector = {
    --- @alias FileSelectorProvider "native" | "fzf" | "mini.pick" | "snacks" | "telescope" | string
    provider = 'fzf',
    -- Options override for custom providers
    provider_opts = {},
  },
})
