local globals = {
  -- -- NerdCommenter global settings:
  --NERDSpaceDelims = 1, -- add space after comment delimiters
  --NERDCompactSexyComs = 1, -- use compact syntax for prettified multi-line comments (skip the `*`?)
  --NERDCommentEmptyLines = 1, -- allow commenting empty lines (useful when commenting a region)
  --NERDTrimTrailingWhitespace = 1, -- trim space when uncommenting
  --NERDToggleCheckAllLines = 1, -- force toggling to check all lines
  --NERDBlockComIgnoreEmpty = 0, -- force right-side delims when doing visual block mode
  --NERDRemoveAltComs = 1, -- remove alt delimiters when uncommenting?
  --NERDCustomDelimiters = { 'ino': { "left": "//", "leftAlt": "/**", "rightAlt": "*/" , }, },

  surround_45 = "{/*\n \r \n*/}", -- sets up a new "JSX Comment" surround command for the `-` key e.g. VS-

  loaded_netrw = 1,
  loaded_netrwPlugin = 1,

  --[[gitgutter options:]]
  --gitgutter_git_executable = 'C:\\Program Files\\Git\\bin\\git.exe',
  --gitgutter_terminal_reports_focus = 0,

  -- wfxr/minimap.vim (scrollbar minimap) settings:
  -- minimap_width = 12,
  -- minimap_highlight_range = 1,       -- highlight viewport range, default 0
  -- minimap_auto_start = 1, -- default 0, "will show on startup"
  -- minimap_auto_start_win_enter = 1, -- default 0, this + auto_start == show on WinEnter
  -- minimap_highlight_search = 1, -- show highlighted words, default 0
  -- minimap_background_processing = 1, -- run in separate process, default 0
  --
  -- minimap_block_filetypes = { 'fugitive', 'nerdtree', 'tagbar', 'fzf', 'nvimtree', },
  -- minimap_block_bufftypes = { 'nofile', 'nowrite', 'quickfix', 'terminal', 'prompt' },
  -- minimap_close_filetypes = { 'startify', 'netrw', 'vim-plug' },
  -- minimap_git_colors = 0, -- show git colors; default 0

  codeium_no_map_tab = 1, -- disable default bindings 

  -- c_syntax_for_h = 1, -- use c syntax for h files, rather than cpp
}

vim.cmd [[
  autocmd ColorScheme *
    \ highlight minimapCursor            ctermbg=59  ctermfg=228 guibg=#5F5F5F guifg=#FFFF87 |
    \ highlight minimapRange             ctermbg=242 ctermfg=228 guibg=#4F4F4F guifg=#FFFF87
]]



-- apply the globals:
for k, v in pairs(globals) do
  vim.g[k] = v
end


-- gitgutter: remove auto format on idle
--vim.cmd [[  autocmd! gitgutter CursorHold,CursorHoldI ]]
-- run when saving the buffer
--vim.cmd [[  autocmd BufWritePost * GitGutter]]
