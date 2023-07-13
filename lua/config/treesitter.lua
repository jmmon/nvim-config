--local ts_status_ok, treesitter = pcall(require, "nvim-treesitter")
--if not ts_status_ok then
  --return
--end

local configs_status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not configs_status_ok then
  return
end

--[[
   [-- hope to fix uv_dlopen bug from indent-blankline
   [local install_status_ok, install = pcall(require, "nvim-treesitter.install")
   [if not install_status_ok then
   [  return
   [end
   [
   [install.compilers = { "clang" }
   ]]

-- what does this do? highlighting! syntax highlighting
configs.setup {
  rainbow = { -- enable ts-rainbow parenthesis
    enable = true,
    -- list of langs to disable
    --disable = { "jsx", "cpp" },
    -- which query to use for finding delimiters
    query = 'rainbow-parens',
    -- highlight entire buffer all at once
    strategy = require 'ts-rainbow.strategy.global',
  },
  -- use autotag (html auto closing tag)
  autotag = {
    enable = true,
  },
  -- auto close pairs of parenthesis etc
  autopairs = {
    enable = true,
  },
  --ensure_installed = {
    ----"lua",
    ----"markdown",
    ----"markdown_inline",
    ----"bash",
    ----"python",
    --"javascript",
    --"typescript",
    --"tsx",
    ----"html",
    --"css",
    --"vim",
    ----"comment",
  --},
  ensure_installed = {
    "javascript",
    "typescript",
    "tsx",
    "css",
    "vim",
  },
  --ignore_install = {
    --""
  --},
  sync_install = false,
  auto_install = true,
  highlight = {
    --enable = true,
    enable = false,
    additional_vim_regex_highlighting = false,
    --disable = {
    ----"css"
      ----"html"
    --},
  },
  indent = {
    enable = true,
    disable = {
      "python",
      --"css"
    }
  },
}
