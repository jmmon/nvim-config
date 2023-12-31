local status_ok, prettier = pcall(require, "prettierd")
if not status_ok then
  return
end

local opts = {
  arrow_parens = "always",
  bracket_spacing = true,
  bracket_same_line = false,
  embedded_language_formatting = "auto",
  end_of_line = "lf",
  html_whitespace_sensitivity = "css",
  -- jsx_bracket_same_line = false,
  jsx_single_quote = true,
  print_width = 80,
  prose_wrap = "preserve",
  quote_props = "as-needed",
  semi = true,
  single_attribute_per_line = true,
  single_quote = true,
  tab_width = 2,
  trailing_comma = "es5",
  use_tabs = false,
  vue_indent_script_and_style = false,
  config_precedence = "prefer-file", -- or "cli-override" or "file-override"
}

prettier.setup({
  bin = 'prettierd', -- or `'prettierd'` (v0.22+)
  filetypes = {
    "graphql",
    "yaml",
    "json",
    "markdown",
    "html",
    "css",
    "scss",
    "less",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
"arduino",
"ino",
"h",
"cpp"
  },

  ["null-ls"] = {
    condition = function()
      return prettier.config_exists({
        -- if `false`, skips checking `package.json` for `"prettier"` key
        check_package_json = true,
      })
    end,

    runtime_condition = function(params)
      -- return false to skip running prettier
      return true
    end,

    timeout = 10000,
  },

  cli_options = opts,
})
