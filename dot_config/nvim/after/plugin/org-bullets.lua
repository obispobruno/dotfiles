require('org-bullets').setup({
  indent = true, -- Adds indentation guides to all levels
  show_current_line = true, -- Show current item's bullet
  concealcursor = false, -- If false then when the cursor is on a line underlying characters are visible
  symbols = {
    list = '•',
    headlines = { '◉', '○', '✸', '✿' },
    checkboxes = {
      half = { '-', 'OrgTSCheckboxHalfChecked' },
      done = { '✓', 'OrgDone' },
      todo = { ' ', 'OrgTODO' },
    },
  },
})
