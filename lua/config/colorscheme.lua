-- colorscheme and options

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


--local status_ok, catppuccin = pcall(require, "catppuccin")
--if not status_ok then
--return
--end

--catppuccin.setup({
--flavor = "mocha", -- latte, frappe, macchiato, mocha
--background = { -- :h background
--light = "latte",
--dark = "mocha",
--},
--transparent_background = true,
--term_colors = true, -- set terminal colors

--show_end_of_buffer = false, -- show the '~' characters after the end of buffers

--dim_inactive = { -- dim inactive splits/windows/buffers
--enabled = false,
--shade = "dark",
--percentage = 0.15,
--},

--no_italic = false, -- Force no italic
--no_bold = false, -- Force no bold

--styles = {
--comments = { "italic" },
--conditionals = { "italic" },
--loops = {},
--functions = { "italic" },
--keywords = { "bold", "italic" },
--strings = {},
--variables = {},
--numbers = {},
--booleans = {},
--properties = {},
--types = {},
--operators = {},
--},
--color_overrides = {},
--custom_highlights = {},
--integrations = {
--cmp = true,
--gitsigns = true,
--nvimtree = true,
--telescope = true,
--notify = false,
--mini = false,
--mason = true,
--treesitter = true,
--treesitter_context = true,
--gitgutter = true,
--illuminate = true,
--which_key = true,
---- airline_theme is set separately
---- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
--},
--})




-- For github theme
--local status_ok, gh = pcall(require, "github-theme")
--if not status_ok then
  --return
--end

--gh.setup({
  --theme_style = "dark", -- dark_default, dimmed, dark_colorblind

  --comment_style = "italic",
  --keyword_style = "bold,italic",
  --function_style = "italic",
  --variable_style = "italic",

  --transparent = true,
--})


-- customize settings, placed BEFORE colorscheme selection:
local globals = {
  --airline_theme = "catppuccin",
  --airline_theme = 'onedark_vivid',
  --airline_theme = 'onedark',

  --dracula_italic = 1, -- not working? airline_theme = "onedarkpro",

  --airline_theme = 'pop_punk', -- if I want
  --
  --airline_theme = 'onehalfdark', -- not working

  -- =================================
  -- more themes to try:
  -- =================================

  -- onedark theme settings
  --[[
     [onedark_terminal_italics = 1, -- yes italics work with onedark!
     [onedark_termcolors = 256,
     [airline_theme = 'onedark',
     ]]

  --[[
     [-- vim-code-dark
     [airline_theme = 'codedark',
     [codedark_term256 = 1,
     [--codedark_conservative = 1, -- less colors? Probably don't want this
     [codedark_italics = 1, -- if terminal supports italics
     [codedark_transparent = 1, -- make bg transparent
     ]]

  --snazzybuddy_icons = true -- web-devicons support

  --[[
     [airline_theme = 'one',
     [one_allow_italics = 1,
     ]]

  -- =================================
  -- polyglot_disabled = ['jsx'] -- only if using JSX-Pretty AND polyglot
}

-- apply the globals:
for k, v in pairs(globals) do
  vim.g[k] = v
end



-- good themes
local colorscheme = "onedark_vivid" -- dark pro theme -- okay, pretty vivid
--local colorscheme = 'onedarkhc'

--local colorscheme = "github_dark"

-- default theme, pretty good, has italics
--local colorscheme =  "catppuccin-mocha" -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

--local colorscheme = "dracula"
--local colorscheme = "molokai" -- not bad, heavy orange, darker

--local colorscheme = 'pop-punk' -- okay, pretty bright contrast

-- new themes to try:
--local colorscheme = "onehalfdark" -- not working
--local colorscheme = "onedark"

--local colorscheme = "codedark" -- vim-code-dark
--local colorscheme = "purify" -- not working
--local colorscheme = "snazzybuddy"
--local colorscheme = "one"

local status_ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not status_ok then
  return
end
