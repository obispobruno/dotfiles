local nmap = require('core.keymap').nmap

nmap('<leader>al', '<cmd>AvanteClear<cr>', 'Avante clear')

require('avante').setup({
  ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
  provider = 'copilot',
  auto_suggestions_provider = 'copilot',
  system_prompt = function()
    local hub = require('mcphub').get_hub_instance()
    return hub and hub:get_active_servers_prompt() or ''
  end,
  -- Using function prevents requiring mcphub before it's loaded
  custom_tools = function()
    return {
      require('mcphub.extensions.avante').mcp_tool(),
    }
  end,
  providers = {
    copilot = {
      model = 'claude-sonnet-4',
    },
    morph = {
      model = 'morph-v3-large',
    },
    ollama = {
      endpoint = 'http://localhost:11434',
      model = 'deepseek-r1:8b',
    },
    groq = {
      __inherited_from = 'openai',
      api_key_name = 'GROQ_API_KEY',
      endpoint = 'https://api.groq.com/openai/v1/',
      model = 'llama-3.3-70b-versatile',
    },
    deepseek_r1 = {
      __inherited_from = 'openai',
      endpoint = 'https://api.deepseek.com/',
      model = 'deepseek-reasoner',
      api_key_name = 'DEEPSEEK_API_KEY',
      disable_tools = true,
    },
    deepseek_v3 = {
      __inherited_from = 'openai',
      endpoint = 'https://api.deepseek.com/',
      model = 'deepseek-chat',
      api_key_name = 'DEEPSEEK_API_KEY',
    },
  },
  web_search_engine = {
    provider = 'searxng', -- tavily, serpapi, searchapi, google, kagi, brave, or searxng
    proxy = nil, -- proxy support, e.g., http://127.0.0.1:7890
  },
  behaviour = {
    auto_suggestions = false,
    auto_set_highlight_group = true,
    auto_set_keymaps = true,
    -- auto_apply_diff_after_generation = true,
    support_paste_from_clipboard = false,
    minimize_diff = true,
    enable_fastapply = true,
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

vim.cmd('AvanteSwitchProvider copilot')
