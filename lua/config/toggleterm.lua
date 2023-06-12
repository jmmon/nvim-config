--function _G.set_terminal_keymaps()
--local opts = {buffer = 0}
--vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
--vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
--vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
--vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
--vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
--vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
--vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
--end

--vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
--


local tt_status_ok, toggleterm = pcall(require, "toggleterm")
if not tt_status_ok then
  return
end

toggleterm.setup({
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return 15 + (vim.o.columns * 0.40)
    end
  end,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  autochdir = false,
  shade_terminals = false, -- add a shading to the terminal
  --shading_factor = '-15',
  start_in_insert = true,
  insert_mappings = true,
  terminal_mapings = true,
  persist_size = true,
  persist_mode = true,
  direction = "horizontal", -- | "vertical" | "float"
  close_on_exit = false, -- when process exists, close terminal
  shell = vim.o.shell,
  auto_scroll = true,
  float_opts = {
    -- only relevant if direction is set to "float"
    border = "curved",
    winblend = 3,
    -- width = <value>, height = <value>,
  },
  winbar = {
    enabled = false,
    name_formatter = function(term) -- term : Terminal
      return term.name
    end
  }
})

-- for keybinds
local opts = { noremap = true, silent = true }
-- set up special float terminal for LazyGit
local tt_term_status_ok, toggleterm_term = pcall(require, "toggleterm.terminal")
if not tt_term_status_ok then
  return
end

local Terminal = toggleterm_term.Terminal

local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "double",
  },
  on_open = function(term)
    vim.cmd('startinsert!')
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", opts)
  end,
  on_close = function(term)
    vim.cmd('startinsert!')
  end,
})

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", opts)

local node = Terminal:new({ cmd = "node", hidden = true })

function _node_toggle()
  node:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>tn", "<cmd>lua _node_toggle()<CR>", opts)

local python = Terminal:new({ cmd = "python3", hidden = true })

function _python_toggle()
  python:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>tp", "<cmd>lua _python_toggle()<CR>", opts)

vim.api.nvim_set_keymap("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", opts)
