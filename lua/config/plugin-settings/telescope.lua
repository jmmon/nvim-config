-- for <leader>ff and <leader>ft
-- a window popup for searching
local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"

telescope.setup {
  pickers = {
    flex = {
      layout_config = {
        flip_columns = 100,
        preview_cutoff = 0,
      }
    },

    --vertical = {
      --height = 0.9,
      --preview_cutoff = 40,
      --prompt_position = "bottom",
      --width = 0.8,
    --},
    --horizontal = {
      --height = 0.9,
      --preview_cutoff = 120,
      --prompt_position = "bottom",
      --width = 0.8,
    --}
  },
  defaults = {
    layout_strategy = "vertical",
    --cycle_layout_list = {
      --"horizontal", "vertical", "flex",
    --},
    --horizontal = {
      --layout_config = {
        --preview_cutoff = 101,
      --}
    --},
    --layout_config = {
      --preview_width = 0.55,
      --flip_columns = 120,
    --},
    prompt_prefix = "",
    selection_caret = "",
    path_display = { "smart" },
    file_ignore_patterns = {
      ".git/",
      "node_modules"
    },
    mappings = {
      i = {
        ["<Down>"] = actions.cycle_history_next,
        ["<Up>"] = actions.cycle_history_prev,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        --["<C-n>"] = telescope.actions.layout.cycle_layout_next,
        --["<C-p>"] = telescope.actions.layout.cycle_layout_prev,
      },
    },
  },
}
