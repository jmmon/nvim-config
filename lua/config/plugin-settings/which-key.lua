local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

which_key.setup {
  -- config options
  plugins = {
    -- show marks on ' and `
    -- show registers on " in NORMAL or <C-r> in INSERT
    spelling = {
      enabled = true,
      suggestions = 30,
    },
    -- presets = {
    --
    -- }
  },
  key_labels = {
    ["<space>"] = "SPACE",
    ["<tab>"] = "TAB",
  },
  window = {
    winblend = 0,
  },
  layout = {
    align = "center",
    height = { min = 4, max = 20  }, -- columns height restrictions
    -- width = { min = 20, max = 50  }, -- columns width restrictions
    -- spacing = 3, -- gap between columns
  }
}
