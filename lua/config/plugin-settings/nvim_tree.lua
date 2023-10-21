-- explorer

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

vim.cmd [[  autocmd VimEnter * :hi NvimTreeOpenedFile gui=bold guifg=#ffd7ff ctermfg=225 guibg=#080808 ctermbg=232 term=bold cterm=bold ]] -- bold text

--*nvim-tree.actions.open_file.quit_on_open*
nvim_tree.setup {
  -- hijack_unnamed_buffer_when_opening = true,

  modified = {
    enable = true,
    show_on_dirs = true,
    show_on_open_dirs = false, -- only show modified on folders if the folder is closed

  },
  -- this really slows things down in large repos, so it's disabled
  git = {
    enable = false,
    -- ignore = true,
    -- timeout = 200,
  },

  update_focused_file = {
    enable = true,
    update_root = false, -- trying false
  },

  renderer = {
    add_trailing = true,
    highlight_opened_files = 'all',
    group_empty = true,
    indent_width = 2, -- default: 2
    -- indent markers: add symbols before file names found inside folders
    indent_markers = {
      enable = false,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "",
        item = "",
        -- edge = "│",
        -- item = "│",
        bottom = "─",
        none = " ",
      },
    },

    root_folder_label = ":~:s?$?/..?",
    -- :~ == reduce filename to be relative to HOME directory
    -- :s? == run a replace
    -- :s? $ ? /.. ? == run replace, replacing $ with /..
    -- root_folder_label = function(path)
    --   return ".../" .. vim.fn.fnamemodify(path, ':t')
    -- end
    -- root_folder_label = ":t",
    icons = {
      git_placement = "after", --  "after"|"before"|"signcolumn"
      modified_placement = "after",
      diagnostics_placement = "signcolumn",
      padding = " ", -- inserted between icon and filename
      glyphs = {
        --default = "~",
        default = "",
        symlink = "",
        bookmark = "",
        modified = "●",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          -- arrow_closed = "",
          -- arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
        --git = {
        --unstaged = "+",
        --staged = "S",
        --unmerged = "*",
        --renamed = "R",
        --untracked = "U",
        --deleted = "-",
        --ignored = "#",
        --},
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    debounce_delay = 100, -- increase if diagnostics causes slowness
    severity = {
      min = vim.diagnostic.severity.INFO,
      max = vim.diagnostic.severity.ERROR,
    },
    icons = {
      --hint = "#",
      --info = "?",
      --warning = "!",
      --error = "X",
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  view = {
    side = "left",
    --width = 30,
    width = function()
      -- if cols = 120, * 0.4 = 48 + 15 = 63, too much!
      -- instead, * 0.15 = 18 + 15 = 33
      -- instead, * 0.10 = 12 + 15 = 27
      --return 30
      -- 5% + 20 lines + 0.5 lines (to round up)
      -- typically 183 cols wide
      -- 5% * 183 + 20.5 = 9.15 + 20.5 = 29.65
      return 20 + math.floor((vim.o.columns * 0.075) + 0.5)
    end,
    debounce_delay = 100, -- increase if rerender causes slowness
    signcolumn = "yes",
    mappings = {
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" }, -- open/edit the file
        { key = "h",                  cb = tree_cb "close_node" },
        { key = "v",                  cb = tree_cb "vsplit" },
        { key = "<C-v>",              cb = tree_cb "split" },
        { key = "[d",                 cb = tree_cb "prev_diag_item" },
        { key = "]d",                 cb = tree_cb "next_diag_item" },
        { key = "[g",                 cb = tree_cb "prev_git_item" },
        { key = "]g",                 cb = tree_cb "next_git_item" },
        { key = "P",                  cb = tree_cb "parent_node" },
      },
    },
  },
  filters = {
    dotfiles = false,
    --custom = {
    --"^.*.log",
    --"^.*.txt",
    --}
  },
}

-- Start NvimTree when Vim is started without file arguments.
vim.cmd [[
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NvimTreeOpen | endif
]]

-- Start NvimTree when Vim is started.
-- vim.cmd [[ autocmd VimEnter * NvimTreeOpen ]]
