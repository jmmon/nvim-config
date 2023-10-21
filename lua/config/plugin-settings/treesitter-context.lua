local treesitterContext = require('treesitter-context')

treesitterContext.setup({
  max_lines = 5, -- default 0
  multiline_threshold = 5, -- default 20
  trim_scope = 'inner', -- default 'outer': trim these scope lines, if over max_lines
})

vim.keymap.set("n", "[c", function()
  treesitterContext.go_to_context()
end, { silent = true })
