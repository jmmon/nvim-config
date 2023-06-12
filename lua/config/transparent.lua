local status_ok, transparent = pcall(require, "transparent")
if not status_ok then
    return
end

-- makes background transparent
transparent.setup {
  enable = true, -- boolean: enable transparent   
  --extra_groups = { -- table/string: additional groups that should be cleared     
    ---- In particular, when you set it to 'all', that means all available groups      
    ----"all",
  --},
  --exclude = {}, -- table: groups you don't want to clear
}
