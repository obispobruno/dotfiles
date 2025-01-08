local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local nmap = function(keys, func, desc)
      if desc then
        desc = 'LSP ' .. desc
      end
      vim.keymap.set('n', keys, func, { buffer = event.buf, desc = desc, remap = false })
    end

    -- Mappings
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('gd', vim.lsp.buf.definition, 'Goto Definition')
    nmap('gD', vim.lsp.buf.declaration, 'Goto Declaration')
    nmap('gi', vim.lsp.buf.implementation, 'Goto Implementation')
    nmap('go', vim.lsp.buf.type_definition, 'Goto Type Definition')
    nmap('gr', vim.lsp.buf.references, 'Goto References')
    nmap('gs', vim.lsp.buf.signature_help, 'Signature Help')
    nmap('ld', vim.diagnostic.open_float, 'Open Diagnostics')
    nmap('[d', vim.diagnostic.goto_prev, 'Goto Previous Diagnostic')
    nmap(']d', vim.diagnostic.goto_next, 'Goto Next Diagnostic')
    nmap('<leader>rn', vim.lsp.buf.rename, 'Rename')
    nmap('<leader>fm', vim.lsp.buf.format, 'Format')
    nmap('<leader>ca', vim.lsp.buf.code_action, 'Code Action')

    -- Telescope
    nmap('<leader>ls', '<cmd>Telescope lsp_document_symbols<cr>', 'Document Symbols')
    nmap('<leader>Ws', '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>', 'Workspace Symbols')
    nmap('<leader>ld', '<cmd>Telescope diagnostics<cr>', 'Workspace Diagnostics')
    nmap('<leader>rs', '<cmd>Telescope resume<cr>', 'Resume Last Telescope Session')
  end,
})

local default_setup = function(server)
  lspconfig[server].setup({
    capabilities = lsp_capabilities,
  })
end

require('mason').setup({})
require('mason-lspconfig').setup({
  automatic_installation = true,
  ensure_installed = {
    'lua_ls',
    'ts_ls',
    'eslint',
    'prismals',
    'bashls',
    'dockerls',
    'docker_compose_language_service',
    'vimls',
    'html',
    'cssls',
    'angularls',
  },
  handlers = {
    default_setup,
  },
})

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {
          'vim',
          'require',
        },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})
