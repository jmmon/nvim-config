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
  
}



-- apply the globals:
for k, v in pairs(globals) do
  vim.g[k] = v
end


-- gitgutter: remove auto format on idle
--vim.cmd [[  autocmd! gitgutter CursorHold,CursorHoldI ]] 
-- run when saving the buffer
--vim.cmd [[  autocmd BufWritePost * GitGutter]] 
