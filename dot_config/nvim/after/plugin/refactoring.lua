require("refactoring").setup()
local nmap = require('core.keymap').nmap
local xmap = require('core.keymap').xmap

xmap("<leader>re", ":Refactor extract ")
xmap("<leader>rf", ":Refactor extract_to_file ")

xmap("<leader>rv", ":Refactor extract_var ")

vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var")

nmap("<leader>rI", ":Refactor inline_func")

nmap("<leader>rb", ":Refactor extract_block")
nmap("<leader>rbf", ":Refactor extract_block_to_file")
