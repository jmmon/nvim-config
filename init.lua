require ("impatient").enable_profile()
require "config.globals"
require "config.options"
require "config.keymaps"
require "config.plugins"

require "config.colorscheme" -- does setup and sets colorscheme
require "config.lualine" -- status line, shows buffers etc

require "config.telescope" -- for find file, find text
require "config.treesitter" -- syntax highlighting
require "config.web-devicons" -- set up custom icons
require "config.nvim_tree" -- file browser side window

-- navigator LSP 
--require "config.navigator" -- new LSP + func definitions etc

-- new lsp
require "config.lsp_zero" -- includes emmet_ls!

 -- old lsp
--require "config.cmp_old"
--require "config.lsp_old" 

require "config.which-key" -- pop up key combinations

-- prettier formatting :Prettier or <leader>lff?
require "config.null-ls"
require "config.prettier"

-- toggleterm and lazygit terminal functions and hotkeys
require "config.toggleterm"
require "config.illuminate" -- highlight occurrances
require "config.autopairs" -- might cause cmp suggestions to break!

--require "config.indent-blankline" -- indent colors
--require "config.transparent" -- bg

