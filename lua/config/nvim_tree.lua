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

nvim_tree.setup {
  git = {
    enable = true,
    ignore = false,
    timeout = 400,
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  renderer = {
    highlight_opened_files = 'all',
    group_empty = true,
    indent_markers = {
      enable = false,
    },
    root_folder_modifier = ":t",
    icons = {
      --git_placement = "signcolumn",
      git_placement = "after", -- or "before" or "signcolumn"
      glyphs = {
        --default = "~",
        default = "",
        symlink = "",
        bookmark = "",
        modified = "●",
        folder = {
          arrow_closed = "",
          arrow_open = "",
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
    debounce_delay = 150,
    icons = {
      hint = "#",
      info = "?",
      warning = "!",
      error = "X",
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
      return 20 + math.floor((vim.o.columns * 0.05) + 0.5)
    end,
    debounce_delay = 150,
    signcolumn = "yes",
    mappings = {
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" }, -- open/edit the file
        { key = "h",                  cb = tree_cb "close_node" },
        { key = "v",                  cb = tree_cb "vsplit" },
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
