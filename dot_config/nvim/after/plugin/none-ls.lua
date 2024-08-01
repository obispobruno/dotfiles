local null_ls = require('null-ls')

local b = null_ls.builtins

local sources = {
  -- webdev
  b.formatting.prettier.with({
    filetypes = {
      'html',
      'markdown',
      'css',
      'javascript',
      'json',
      'typescript',
      'yaml',
      'org',
    },
  }),

  b.formatting.csharpier.with({
    filetypes = {
      'c#',
      'cs',
    },
  }),

  -- bash
  b.formatting.shfmt,

  -- Lua
  b.formatting.stylua,

  -- C/C++
  b.formatting.clang_format,

  -- SQL
  -- b.formatting.sqlfmt,
  -- b.formatting.sql_formatter,
}

null_ls.setup({
  sources = sources,
})
