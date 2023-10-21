require ("impatient").enable_profile()
require "config.globals"
require "config.options"
require "config.keymaps"
require "config.plugins"
require "config.plugin-settings.transparent" -- bg

require "config.plugin-settings.colorscheme" -- does setup and sets colorscheme
require "config.plugin-settings.lualine" -- status line, shows buffers etc

require "config.plugin-settings.telescope" -- for find file, find text
require "config.plugin-settings.treesitter" -- syntax highlighting
require "config.plugin-settings.web-devicons" -- set up custom icons
require "config.plugin-settings.nvim_tree" -- file browser side window

-- navigator LSP 
--require "config.plugin-settings.navigator" -- new LSP + func definitions etc

-- new lsp
require "config.plugin-settings.lsp_zero" -- includes emmet_ls!

 -- old lsp
--require "config.plugin-settings.cmp_old"
--require "config.plugin-settings.lsp_old" 

require "config.plugin-settings.which-key" -- pop up key combinations

-- prettier formatting :Prettier or <leader>lff?
require "config.plugin-settings.null-ls"
require "config.plugin-settings.prettier"

-- toggleterm and lazygit terminal functions and hotkeys
require "config.plugin-settings.toggleterm"
require "config.plugin-settings.illuminate" -- highlight occurrances
-- require "config.plugin-settings.autopairs" -- might cause cmp suggestions to break!

require "config.plugin-settings.comment" -- comment.nvim config

--require "config.plugin-settings.indent-blankline" -- indent colors

