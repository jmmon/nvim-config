-- general keymaps

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ** Legend: **
-- n: normal mode
-- i: insert mode
-- v: visual mode
-- x: visual block mode
-- t: term mode
-- c: command mode

keymap("i", "jk", "<ESC>", opts);

-- navigate between windows
  -- when in terminal mode...
keymap("t", "<A-h>", "<C-\\><C-N><C-w>h", opts)
keymap("t", "<A-j>", "<C-\\><C-N><C-w>j", opts)
keymap("t", "<A-k>", "<C-\\><C-N><C-w>k", opts)
keymap("t", "<A-l>", "<C-\\><C-N><C-w>l", opts)
  -- when in insert mode...
keymap("i", "<A-h>", "<C-\\><C-N><C-w>h", opts)
keymap("i", "<A-j>", "<C-\\><C-N><C-w>j", opts)
keymap("i", "<A-k>", "<C-\\><C-N><C-w>k", opts)
keymap("i", "<A-l>", "<C-\\><C-N><C-w>l", opts)
  -- when in normal mode...
keymap("n", "<A-h>", "<C-w>h", opts)
keymap("n", "<A-j>", "<C-w>j", opts)
keymap("n", "<A-k>", "<C-w>k", opts)
keymap("n", "<A-l>", "<C-w>l", opts)

-- resize window size
keymap("n", "<C-Up>", ":resize -2<cr>", opts)
keymap("n", "<C-Down>", ":resize +2<cr>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<cr>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<cr>", opts)
keymap("n", "<C-S-Up>", ":resize -5<cr>", opts)
keymap("n", "<C-S-Down>", ":resize +5<cr>", opts)
keymap("n", "<C-S-Left>", ":vertical resize -5<cr>", opts)
keymap("n", "<C-S-Right>", ":vertical resize +5<cr>", opts)

-- move selected text vertically ( and auto-indent )
keymap("v", "<S-j>", ":move '>+1<cr>gv=gv", opts)
keymap("v", "<S-k>", ":move '<-2<cr>gv=gv", opts)

-- navigate between buffers
keymap("n", "<S-l>", ":bnext<cr>", opts)
keymap("n", "<S-h>", ":bprevious<cr>", opts)

-- delete this buffer - doesn't work??
keymap("n", "<C-S-w>q", "<cmd>bprevious<bar>bdelete#<cr>", opts)
-- close all other buffers
keymap("n", "<C-S-w>qa", "<cmd>%bd<bar>e<cr>", opts)

-- clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<cr>", opts)

-- copy selected text to global clipboard (instead of vim clipboard)
keymap("v", "<leader>y", "\"+y", opts)
keymap("x", "<leader>y", "\"+y", opts)
keymap("n", "<leader>y", "\"+y", opts)

-- better paste (uses void register)
keymap("v", "<leader>p", '"_dP', opts)
keymap("x", "<leader>p", '"_dP', opts)

-- delete to "void" register
keymap("n", "<leader>d", '"_d', opts)
keymap("v", "<leader>d", '"_d', opts)

-- cursor remains same place when using shift-j
keymap("n", "J", "mzJ`z", opts)

-- ctrl d, u: keeps cursor in the middle of the screen!
keymap("n", "<C-u", "<C-u>zz", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)

-- when searching, keeps cursor in the middle!
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

keymap("n", "Q", "<nop>", opts)

-- ctrl-c will escape
keymap("i", "<C-c>", "<ESC>", opts)

-- stay in indent mode when tabbing
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- toggle nvim tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- telescope
keymap("n", "<leader>ff", ":Telescope find_files<cr>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<cr>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<cr>", opts)

-- lsp format!
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
-- prettier format
keymap("n", "<leader>lff", "<cmd>:Prettier<cr>", opts)

-- reload nvim config?
keymap("n", "<leader>s<Space>", ":source $MYVIMRC<cr>", opts)

--for LSP code action ?
keymap("n", "<A-cr>", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

-- quick fix for jumping to errors
-- how are these different from [d ]d?
keymap("n", "<C-k>", "<cmd>cnext<cr>zz", opts)
keymap("n", "<C-j>", "<cmd>cprev<cr>zz", opts)
keymap("n", "<leader>k", "<cmd>lnext<cr>zz", opts)
keymap("n", "<leader>j", "<cmd>lprev<cr>zz", opts)

-- start replacing the word under the cursor
keymap("n", "<leader>s", ":%s/\\<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", opts)

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.keymap.set("n", "[c", function()
  require("treesitter-context").go_to_context()
end, { silent = true })
