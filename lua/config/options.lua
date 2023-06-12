local options = {
  number = true,
  relativenumber = true,
  --signcolumn = "yes", -- show column for sign ?? for git, diagnostics, etc
  --signcolumn = "number", -- show sign instead of the numbert
  --signcolumn = "yes:1", -- not sure what this does!
  signcolumn = "no",

  -- cursorline and col will slow down rendering when scrolling!
  cursorline = true, -- highlight line the cursor is on 
  cursorcolumn = false, -- highlight col cursor is on
  colorcolumn = "80", -- color the 80th column

  -- improve some drawing/redrawing:
  lazyredraw = true, -- should help with laggy scrolling

  syntax = "off",
  synmaxcol = 500, -- stop syntax highlighting after N columns
  -- redraw - when over this limit, syntax is DISABLED until Ctrl-L is pressed
  --redrawtime = 10000, -- ms - default 2000ms - if redraw takes longer than this, skip redraw
  redrawtime = 5000,


  numberwidth = 4,  -- min width of line number column
  --showtabline = 4,
  showtabline = 1,  -- When to show tabs row (0 = never, 1 = when tabs > 1, 2 = always)

  -- suggestions dropdown max rows:
  pumheight = 10,
  -- suggestion dropdown auto complete behavior:
  completeopt = { "menuone", "noselect" },

  termguicolors = true,
  cmdheight = 1,
  showmode = true,
  showcmd = false,

  -- tabs, indenting
  tabstop = 2, -- tab space value when reading a file
  softtabstop = -1, -- if negative, uses 'shiftwidth' (which can use 'tabstop')
  shiftwidth = 2, -- if 0, uses value of 'tabstop'
  -- Then you ONLY need to set tabstop!
  expandtab = true, -- use spaces instead of tabs

  -- line styling
  autoindent = true,
  smartindent = false,
  wrap = true, -- wrap at the end of the line
  linebreak = true, -- make wrap not break a word

  scrolloff = 8,  -- min num of lines to keep above/below cursor
  sidescrolloff = 8, -- same for horizontal scrolling

  -- search opts
  hlsearch = true, -- highlight search
  incsearch = true, -- incremental search ( search while typing )
  smartcase = true, -- if search contains capital letters, ignore `ignorecase` option

  -- saving, buffers, files
  swapfile = false, -- save file and editor state just in case of a crash
  updatetime = 500, -- ms - time before swap file is written to disk
                    -- ALSO regulates vim-gitgutter, it will trigger after this time

  backup = false,
  undofile = true,
  undodir = os.getenv('HOME') .. "/.vim/undodir",
  writebackup = false,

  fileencoding = "utf-8",
  mouse = "a",
  timeout = true,
  timeoutlen = 500, -- ms - time allowed for a "mapped sequence to complete"


  background = "dark", -- dark or light
  equalalways = false, -- when splitting window, don't equalize the sizes every time
  -- winminheight = 3,
}


-- apply the options
for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.shortmess:append "c"
vim.opt.iskeyword:append "-"
vim.opt.formatoptions:remove({ "c", "r", "o" })
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles")

-- tweaking syntax highlighting
-- maxlines === most lines to look back to find start of a comment
-- minlines === minimum lines to look back to find start of a comment
vim.cmd [[ autocmd VimEnter * :syn sync fromstart ]] -- most accurate but slowest form of highlighting
vim.cmd [[ autocmd BufEnter * :syn sync maxlines=120 ]] -- limit number of lines to scan for syntax highlighting
vim.cmd [[ autocmd VimEnter * :syn sync minlines=60 ]] -- limit number of lines to scan for syntax highlighting


-- make cursor line only underline instead of highlight
vim.cmd [[ autocmd VimEnter * :hi clear CursorLine ]]
vim.cmd [[ autocmd VimEnter * :hi CursorLine  cterm=underline gui=underline guibg=#111111 ]]
--vim.cmd [[ autocmd VimEnter * :hi CursorLine  cterm=underline ctermfg=000000 gui=underline guifg=#000000 guibg=#111111 ]]


vim.cmd [[ autocmd VimEnter * :hi LineNr guifg=#777777 ]]
vim.cmd [[ autocmd VimEnter * :hi CursorLineNr guifg=#F55FFE guibg=#444444 ]]
