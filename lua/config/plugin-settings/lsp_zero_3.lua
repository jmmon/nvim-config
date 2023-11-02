local status_ok, lsp_zero = pcall(require, "lsp-zero")
if not status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn available actions
  -- lsp_zero.default_keymaps({buffer = bufnr});
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "gt", function() vim.lsp.buf.type_definition() end, opts)
  vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)

  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)

  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts) -- query for symbol
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_actions() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts) -- or <F2>

  vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    "html",     -- original
    "cssls",    -- original
    "tsserver", -- original

    "emmet_ls",
    'eslint',

    "cssmodules_ls",
    "tailwindcss",
    "prismals",
    "jsonls",

    "lua_ls",
    "solidity",
    "arduino_language_server",
  },
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
})

local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
  return
end

local cmp_format = lsp_zero.cmp_format()

cmp.setup({
  formatting = cmp_format,
  mapping = cmp.mapping.preset.insert({
    -- scropp up and down the documentation window
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  }),
})
