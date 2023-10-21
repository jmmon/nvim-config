-- colorscheme and options

-- --[[
-- For onedarkpro
local status_ok, onedarkpro = pcall(require, "onedarkpro")
if not status_ok then
  return
end

onedarkpro.setup({
  -- not working...
  styles = {
    comments = "italic",
    keywords = "bold,italic",
    functions = "italic",
    conditionals = "italic",
    variables = "italic",
  },
  options = {
    transparency = true,
  }
})
-- ]]


--[[
-- For onedarkcomment -- no transparency!!!
local status_ok, onedarkcomment = pcall(require, "onedarkcomment")
if not status_ok then
  return
end

onedarkcomment.setup({
  -- not working...
  styles = {
    comments = "italic",
    keywords = "bold,italic",
    functions = "italic",
    conditionals = "italic",
    variables = "italic",
  },
  options = {
    transparency = true,
  }
})
-- ]]


--[[
-- customize settings, placed BEFORE colorscheme selection:
local globals = {
}

-- apply the globals:
for k, v in pairs(globals) do
  vim.g[k] = v
end
]]


-- good themes
-- local colorscheme = "onedark_vivid" -- dark pro theme -- okay, pretty vivid
-- local colorscheme = "onelight" -- or onedark or onelight
-- local colorscheme = "onedarkcomment"
-- local colorscheme = 'onedarkhc'

--local colorscheme = "github_dark"

-- default theme, pretty good, has italics
--local colorscheme =  "catppuccin-mocha" -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

local colorscheme = "dracula"
--local colorscheme = "molokai" -- not bad, heavy orange, darker

--local colorscheme = 'pop-punk' -- okay, pretty bright contrast

-- new themes to try:
--local colorscheme = "onehalfdark" -- not working
--local colorscheme = "onedark"

--local colorscheme = "codedark" -- vim-code-dark
--local colorscheme = "purify" -- not working
--local colorscheme = "snazzybuddy"
--local colorscheme = "one"

local status_ok_cs, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not status_ok_cs then
  return
end
