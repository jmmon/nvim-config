local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

which_key.setup {
  -- config options
  plugins = {
    spelling = {
      enabled = true,
      suggestions = 30,
    }
  },
  window = {
    winblend = 10,
    align = "center"
  }

}
