local status_ok, lsp = pcall(require, "lsp-zero")
if not status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

--lsp.preset({
--name = 'minimal',
--set_lsp_keymaps = true,
--manage_nvim_cmp = true,
--suggest_lsp_servers = false,
--})

---- (Optional) Configure LUA language server for neovim
--lsp.nvim_workspace()

--lsp.setup()
--

lsp.preset('recommended')

lsp.ensure_installed({
  --"sumneko",
  'eslint',
  "lua_ls",
  'eslint',
  "cssls", -- original
  --"html", -- original
  "emmet_ls",
  "tsserver", -- original
  "tailwindcss",
  "cssmodules_ls",
  "prismals",
  --"jsonls", -- original
  -- "pyright", -- original
  -- "bashls", -- original
  -- "yamlls", -- original
  -- "python", -- original
  "solidity",
  "arduino_language_server",
})

local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
  return
end

--local check_backspace = function()
  --local col = vim.fn.col "." - 1
  --return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
--end

local cmp_select = { behavior = cmp.SelectBehavior.Select }
--local cmp_mappings = lsp.defaults.cmp_mappings({
--['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--['<C-y>'] = cmp.mapping.confirm({ select = true }),
--['<C-Space>'] = cmp.mapping.complete(),
--})

local cmp_mappings = lsp.defaults.cmp_mappings({
  ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
  ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
  ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs( -1), { "i", "c" }),
  ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
  ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
  ["<C-e>"] = cmp.mapping {
    i = cmp.mapping.abort(),
    c = cmp.mapping.close(),
  },
  ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  --["<Tab>"] = cmp.mapping(function(fallback) -- better tab
    --if cmp.visible() then
      --cmp.select_next_item()
    --elseif luasnip.expandable() then
      --luasnip.expand()
    --elseif luasnip.expand_or_jumpable() then
      --luasnip.expand_or_jump()
    --elseif check_backspace() then
      --fallback()
    --else
      --fallback()
    --end
  --end, {
    --"i",
    --"s",
  --}),
  --["<S-Tab>"] = cmp.mapping(function(fallback)
    --if cmp.visible() then
      --cmp.select_prev_item()
    --elseif luasnip.jumpable( -1) then
      --luasnip.jump( -1)
    --else
      --fallback()
    --end
  --end, {
    --"i",
    --"s",
  --}),
})


lsp.set_preferences({
  sign_icons = {}
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts) -- query for symbol
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_actions() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)


-- diagnostics highlighting
-- set diagnostics "sign" properties, e.g. for highlighting the number column
--vim.cmd [[ highlight DiagnosticSignError guifg=#000000 guibg=#e06c75 gui=bold,underline cterm=underline ctermfg=204 ]]
--vim.cmd [[ highlight DiagnosticSignWarn guifg=#000000 guibg=#95703b gui=bold,underline cterm=underline ctermfg=180 ]] -- yellow #e5c07b 
--vim.cmd [[ highlight DiagnosticSignInfo guifg=#000000 guibg=#418fcf gui=bold,underline cterm=underline ctermfg=39 ]] -- blue #61afef
--vim.cmd [[ highlight DiagnosticSignHint guifg=#000000 guibg=#3696a2 gui=bold,underline cterm=underline ctermfg=38 ]] -- teal #56b6c2
--vim.cmd [[ highlight DiagnosticSignOk guifg=#000000 guibg=#22cc22 gui=bold,underline cterm=underline ctermfg=10 ]] -- LightGreen

vim.cmd [[  autocmd VimEnter * :hi DiagnosticSignError guifg=#000000 guibg=#e06c75 gui=bold,underline cterm=underline ctermfg=204 ]] -- red
vim.cmd [[  autocmd VimEnter * :hi DiagnosticSignWarn guifg=#000000 guibg=#95703b gui=bold,underline cterm=underline ctermfg=180 ]] -- yellow #e5c07b 
vim.cmd [[  autocmd VimEnter * :hi DiagnosticSignInfo guifg=#000000 guibg=#418fcf gui=bold,underline cterm=underline ctermfg=39 ]] -- blue #61afef
vim.cmd [[  autocmd VimEnter * :hi DiagnosticSignHint guifg=#000000 guibg=#3696a2 gui=bold,underline cterm=underline ctermfg=38 ]] -- teal #56b6c2
vim.cmd [[  autocmd VimEnter * :hi DiagnosticSignOk guifg=#000000 guibg=#22cc22 gui=bold,underline cterm=underline ctermfg=10 ]] -- LightGreen

-- line properties: no underline
--vim.cmd [[  autocmd VimEnter * :hi DiagnosticLineError guibg=#2c1517 ]] -- red -- or #160a0b
--vim.cmd [[  autocmd VimEnter * :hi DiagnosticLineWarn guibg=#2d2618 ]] -- yellow -- or #16130c
--vim.cmd [[  autocmd VimEnter * :hi DiagnosticLineInfo guibg=#13232f ]] -- blue -- or #091117
--vim.cmd [[  autocmd VimEnter * :hi DiagnosticLineHint guibg=#112426 ]] -- teal -- or #081213
--vim.cmd [[  autocmd VimEnter * :hi DiagnosticLineOk guibg=#1c2f1c ]] -- LightGreen -- #0e170e


-- diagnostics signs
local signs = {
  {
    name = "DiagnosticSignError",
    text = "X",
    linehl = "DiagnosticLineError"
  },
  {
    name = "DiagnosticSignWarn",
    text = "!",
    --linehl = "DiagnosticLineWarn"
  },
  {
    name = "DiagnosticSignInfo",
    text = "?",
    --linehl = "DiagnosticLineInfo"
  },
  {
    name = "DiagnosticSignHint",
    text = "#",
    --linehl = "DiagnosticLineHint"
  },
  {
    name = "DiagnosticSignOk",
    text = ":",
    --linehl = "DiagnosticLineOk"
  },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, {
    -- define the signs for diagnostics
    --text = sign.text,
    text = "",
    texthl = sign.name, -- highlight the text causing the error
    numhl = sign.name, -- highlight the linenumber causing the error
    linehl = sign.linehl,
  })
end

-- diagnostics display config
local config = {
  --virtual_text = true,
  virtual_text = {
    source = "if_many",
  },
  signs = {
    active = signs,
  },
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
}

vim.diagnostic.config(config)



-- setting up arduino_language_server
local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
  return
end


lspconfig.arduino_language_server.setup{}

-- setup emmet_ls, mainly for jsx/tsx
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.emmet_ls.setup({
  capabilities = capabilities,
  filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "vue", "typescript", "typescriptreact", "hbs", "handlebars" },
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true,
        ['jsx.enabled'] = true,
      }
    }
  }
})

lsp.skip_server_setup({'eslint'})

-- lastly: run the setup
lsp.setup()
