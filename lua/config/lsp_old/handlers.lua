local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
  return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)
--[[
   [ default colors:
   DiagnosticError xxx ctermfg=204 guifg=#e06c75
DiagnosticWarn xxx ctermfg=180 guifg=#e5c07b
DiagnosticInfo xxx ctermfg=39 guifg=#61afef
DiagnosticHint xxx ctermfg=38 guifg=#56b6c2
DiagnosticOk   xxx ctermfg=10 guifg=LightGreen
   ]]
-- set diagnostics "sign" properties, e.g. for highlighting the number column
vim.cmd [[  autocmd VimEnter * :hi DiagnosticSignError guifg=#000000 guibg=#e06c75 gui=bold,underline cterm=underline ctermfg=204 ]] -- red
vim.cmd [[  autocmd VimEnter * :hi DiagnosticSignWarn guifg=#000000 guibg=#e5c07b gui=bold,underline cterm=underline ctermfg=180 ]] -- yellow
vim.cmd [[  autocmd VimEnter * :hi DiagnosticSignInfo guifg=#000000 guibg=#61afef gui=bold,underline cterm=underline ctermfg=39 ]] -- blue
vim.cmd [[  autocmd VimEnter * :hi DiagnosticSignHint guifg=#000000 guibg=#56b6c2 gui=bold,underline cterm=underline ctermfg=38 ]] -- teal
vim.cmd [[  autocmd VimEnter * :hi DiagnosticSignOk guifg=#000000 guibg=LightGreen gui=bold,underline cterm=underline ctermfg=10 ]] -- LightGreen

-- set diagnostics line properties, e.g. for custom backgrounds etc for the entire line
--vim.cmd [[  autocmd BufReadPost * :hi DiagnosticLineError guibg=#2c1517 gui=underdouble cterm=underdouble ]] -- red -- or #160a0b
--vim.cmd [[  autocmd BufReadPost * :hi DiagnosticLineWarn guibg=#2d2618 gui=undercurl cterm=undercurl ]] -- yellow -- or #16130c
--vim.cmd [[  autocmd BufReadPost * :hi DiagnosticLineInfo guibg=#13232f gui=underdotted cterm=underdotted ]] -- blue -- or #091117
--vim.cmd [[  autocmd BufReadPost * :hi DiagnosticLineHint guibg=#112426 gui=underline cterm=underline ]] -- teal -- or #081213
--vim.cmd [[  autocmd BufReadPost * :hi DiagnosticLineOk guibg=#1c2f1c gui=underdashed cterm=underdashed ]] -- LightGreen -- #0e170e

-- line properties: no underline
vim.cmd [[  autocmd VimEnter * :hi DiagnosticLineError guibg=#2c1517 ]] -- red -- or #160a0b
vim.cmd [[  autocmd VimEnter * :hi DiagnosticLineWarn guibg=#2d2618 ]] -- yellow -- or #16130c
vim.cmd [[  autocmd VimEnter * :hi DiagnosticLineInfo guibg=#13232f ]] -- blue -- or #091117
vim.cmd [[  autocmd VimEnter * :hi DiagnosticLineHint guibg=#112426 ]] -- teal -- or #081213
vim.cmd [[  autocmd VimEnter * :hi DiagnosticLineOk guibg=#1c2f1c ]] -- LightGreen -- #0e170e
--error
--error
--local settings
--local settings

--vim.cmd [[  autocmd BufEnter * :hi CursorLine gui=underline cterm=underline ]]

M.setup = function()
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
      text = sign.text,
      texthl = sign.name, -- highlight the text causing the error
      numhl = sign.name, -- highlight the linenumber causing the error
      linehl = sign.linehl,
    })
  end

  local config = {
    --virtual_text = true,
    virtual_text = {
      source = "if_many",
    },
    --virtual_text = false,
    signs = {
      active = signs,
    },
    update_in_insert = true,
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

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap
  keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
  keymap(bufnr, "n", "<leader>lI", "<cmd>Mason<cr>", opts)
  keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
  keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
  keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
  keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
  keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
end

M.on_attach = function(client, bufnr)
  --[[
		 [if client.name == "tsserver" then
		 [  client.server_capabilities.documentFormattingProvider = false
		 [end
     ]]
  if client.name == "sumneko_lua" then
    client.server_capabilities.documentFormattingProvider = false
  end

  lsp_keymaps(bufnr)
end

return M
