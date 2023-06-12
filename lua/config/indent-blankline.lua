local status_ok, indentBlankLine = pcall(require, "indent_blankline")
if not status_ok then
  return
end

---- example
----vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine cterm=underline ctermfg=204 ]]

---- colors for the indent char
--vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine ctermfg=167 ]] -- #d75f5f
--vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine ctermfg=186 ]] -- #d7d787
--vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine ctermfg=108 ]] -- #87af87
--vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine ctermfg=73 ]] -- #5fafaf
--vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine ctermfg=75 ]] -- #5fafff
--vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine ctermfg=176 ]] -- #d787d7

---- highlight of indent character
----vim.cmd [[highlight IndentBlanklineChar guifg=#E06C75 gui=nocombine ctermfg=167 ]] -- #d75f5f

--vim.opt.list = true
---- show special characters as the EOL and space
----vim.opt.listchars:append "space:⋅" -- broken char?
----vim.opt.listchars:append "eol:↴" -- broken char?

--indentBlankLine.setup {
---- indicates what char acts as the "space" char??
----space_char_blankline = " ",

---- show EOL sign?
----show_end_of_line = true,

---- highlight indentations with the highlight colors (cycles through the list)
----char_highlight_list = {
----"IndentBlanklineIndent1",
----"IndentBlanklineIndent2",
----"IndentBlanklineIndent3",
----"IndentBlanklineIndent4",
----"IndentBlanklineIndent5",
----"IndentBlanklineIndent6",
----},

---- highlight the current scope??
--show_current_context = true,
---- underline start of current scope
--show_current_context_start = true,

--char_blankline = '¦', -- ¦, ┆, │, ⎸, or ▏
--}



-- alternate -- show faded indent line colors

local hl_list = {}
for i, color in pairs({ '#461111', '#565611', '#114621', '#123a3e', '#3f3f7f', '#361135' }) do -- 5th: '#344b7b'
  local name = 'IndentBlanklineIndent' .. i
  vim.api.nvim_set_hl(0, name, { fg = color,  bg = color })
  table.insert(hl_list, name);
end

indentBlankLine.setup {
  char_highlight_list = hl_list,
  --space_char_highlight_list = hl_list, -- highlights space as the same color, so the two spaces of indent are both colored

  show_current_context = true,
  show_current_context_start = true,
  char_blankline = '¦', -- ¦, ┆, │, ⎸, or ▏
  show_trailing_blankline_indent = false,
}


--for i, color in pairs({ '#1f1f1f', '#1a1a1a' }) do
  --local name = 'IndentBlanklineIndent' .. i
  --vim.api.nvim_set_hl(0, name, { bg = color })
  --table.insert(hl_list, name);
--end

--indentBlankLine.setup {
  --char = "",
  --char_highlight_list = hl_list,
  --space_char_highlight_list = hl_list, -- highlights space as the same color, so the two spaces of indent are both colored
  --show_trailing_blankline_indent = false,
  --show_current_context = true,
  --show_current_context_start = true,
--}



-- =======================================================
-- alternate
-- =======================================================
--local hl_list = {}
--for i, colors in pairs({ { gui = '#E06C75', cterm = 167 }, { gui = '#E5C07B', cterm = 186 }, { gui = '#98C379', cterm = 108 }, { gui = '#56B6C2', cterm = 73 }, { gui = '#61AFEF', cterm = 75 }, { gui = '#C678DD', cterm = 176 } }) do
  --local name = 'IndentBlanklineIndent' .. i
  --vim.api.nvim_set_hl(0, name, { fg = colors.gui, bg = colors.gui, ctermfg = colors.cterm, ctermbg = colors.cterm })
  --table.insert(hl_list, name);
--end

--vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine ctermfg=167 ]] -- #d75f5f
--vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine ctermfg=186 ]] -- #d7d787
--vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine ctermfg=108 ]] -- #87af87
--vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine ctermfg=73 ]] -- #5fafaf
--vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine ctermfg=75 ]] -- #5fafff
--vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine ctermfg=176 ]] -- #d787d7

--vim.cmd [[highlight IndentBlanklineIndent1 guifg=#30465d guibg=#14262b gui=nocombine ]]
--vim.cmd [[highlight IndentBlanklineIndent2 guifg=#30465d guibg=#09262e gui=nocombine ]]
--vim.cmd [[highlight IndentBlanklineIndent3 guifg=#30465d guibg=#161e37 gui=nocombine ]]

--indentBlankLine.setup {
  ----char = "▎",
  --show_current_context = true,
  --show_current_context_start = true,
  --char_blankline = '¦', -- ¦, ┆, │, ⎸, or ▏
  --char_highlight_list = hl_list,
  --space_char_highlight_list = hl_list,

  ----char_highlight_list = {
    ----"IndentBlanklineIndent1",
    ----"IndentBlanklineIndent2",
    ----"IndentBlanklineIndent3",
    ------"IndentBlanklineIndent4",
    ------"IndentBlanklineIndent5",
    ------"IndentBlanklineIndent6",
  ----},

  ----space_char_highlight_list = {
    ----"IndentBlanklineIndent1",
    ----"IndentBlanklineIndent2",
    ----"IndentBlanklineIndent3",
    ------"IndentBlanklineIndent4",
    ------"IndentBlanklineIndent5",
    ------"IndentBlanklineIndent6",
  ----},
  --show_trailing_blankline_indent = false,
--}

local unused = {
  test = {
    someVal = {
      "a",
      "b",
      "c"
    },
  },
}
