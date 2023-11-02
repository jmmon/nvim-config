local configs_status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not configs_status_ok then
  return
end

--[[
   [-- hope to fix uv_dlopen bug from indent-blankline
   [local install_status_ok, install = pcall(require, "nvim-treesitter.install")
   [if not install_status_ok then
   [  return
   [end
   [
   [install.compilers = { "clang" }
   ]]

-- what does this do? highlighting! syntax highlighting
configs.setup {
  --ensure_installed = {
    ----"markdown",
    ----"markdown_inline",
    ----"bash",
    ----"comment",
  --},
  ensure_installed = {
    'markdown',
    'css', 'glimmer', 'graphql',
    -- 'handlebars', 
    -- 'hbs',
    'html', 'javascript', 'typescript',
    'lua', 'nix', 'php', 'python',
    -- 'rescript', 
    'scss', 'svelte', 'tsx', 'twig',
    'vim',
    'arduino', 'cpp',
  },
  --ignore_install = {
    --""
  --},
  sync_install = false,
  auto_install = true,
  highlight = {
    -- enable = true,
    enable = false,
    additional_vim_regex_highlighting = false,
    --disable = {
      ----"css"
      ----"html"
    --},
  },

  indent = {
    enable = true,
    disable = {
      -- "python",
      --"css"
    }
  },

  -- enable ts-rainbow parenthesis
  rainbow = {
    enable = true,
    -- list of langs to disable
    --disable = { "jsx", "cpp" },
    -- which query to use for finding delimiters
    query = 'rainbow-parens',
    -- highlight entire buffer all at once
    strategy = require 'ts-rainbow.strategy.global',
  },
  -- use nvim-ts-autotag (html auto closing tag)
  autotag = {
    enable = true,
  },
  -- auto close pairs of parenthesis etc
  -- autopairs = {
  --   enable = true,
  -- },
  -- nvim-ts-context-commentstring - for help with files with multiple languages
  context_commentstring = {
    enable = true,
  },
}

-- set up treesitter folding
local set = vim.opt
set.foldmethod = 'expr'
set.foldexpr = 'nvim_treesitter#foldexpr()'

vim.cmd [[ autocmd FileType * exe "normal zR" ]]
-- vim.cmd [[
-- set foldmethod=expr
-- set foldexpr=nvim_treesitter#foldexpr()
-- set nofoldenable                     " Disable folding at startup. 
-- ]]
--
-- use treesitter for folding
-- local vim = vim
-- local opt = vim.opt
--
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"

-- open all folds on startup
-- vim.cmd [[ autocmd BufReadPost,FileReadPost * normal zR ]]
    -- {"BufReadPost,FileReadPost", "*", "normal zR"}

-- -- treesitter folds: default to open
-- local vim = vim
-- local api = vim.api
-- local M = {}
--
-- -- fn to create list of cmds and convert to autocommands
-- -------- This function is taken from https://github.com/norcalli/nvim_utils
-- function M.nvim_create_augroups(definitions)
--   for group_name, definition in pairs(definitions) do
--     api.nvim_command('augroup '..group_name)
--     api.nvim_command('autocmd!')
--     for _, def in ipairs(definitions) do
--       local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
--       api.nvim_command(command)
--     end
--     api.nvim_command('augroup END')
--   end
-- end
--
-- local autoCommands = {
--   --other autocommands
--   open_folds = {
--     {"BufReadPost,FileReadPost", "*", "normal zR"}
--   },
--   highlight_modifications = {
--     -- cursor line: underline only, rather than highlight
--     {"VimEnter", "*", ":hi clear Cursorline"},
--     {"VimEnter", "*", ":hi Cursorline cterm=underline gui=underline guibg=#111111"},
--
--     -- line number &7 cursor line highlights
--     {"VimEnter", "*", ":hi LineNr guifg=#777777"},
--     {"VimEnter", "*", ":hi CursorlineNr guifg=#f55ffe guibg=#444444"},
--
--     -- treesitter context: bottom row highlight, acting as a separator
--     {"VimEnter", "*", ":hi TreesitterContextBottom gui=underline guisp=Grey"},
--   },
-- }
--
-- M.nvim_create_augroups(autoCommands)

