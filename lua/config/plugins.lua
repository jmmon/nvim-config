local fn = vim.fn

-- automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path, }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- autocommand to reload nvim whenever you save plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- protected call, so we don't error out first
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify('packer require failed')
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- plugins go in here
return packer.startup(function(use)
  -- plugin manager
  use { "wbthomason/packer.nvim" }
  -- lua library?
  use { "nvim-lua/plenary.nvim" }

  -- cache plugins to improve startup time
  use "lewis6991/impatient.nvim"
  -- check startup times of plugins when starting vim with `nvim --startuptime`
  use "dstein64/vim-startuptime"

  -- used for space+f+f and space+f+t search windows
  use { "nvim-telescope/telescope.nvim" }

  -- file browser <leader> + e
  use {
    "nvim-tree/nvim-tree.lua",
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly'
  }

  -- :MarkdownPreview command is available
  --use({
    --"iamcco/markdown-preview.nvim",
    --run = function() vim.fn["mkdp#util#install"]() end,
  --})

   --enable HTML close/change tag names with treesitter
  use { "windwp/nvim-ts-autotag" }

  -- syntax highlighting
  use {
    "nvim-treesitter/nvim-treesitter",
    --run = ":TSUpdate",
  }

  use { "nvim-treesitter/nvim-treesitter-context" }



  -- supposed to show console.logs in floating text, to see values of variables
  --use { "metakirby5/codi.vim" }

  -- cmp lsp plugins (old lsp)

     --use { "hrsh7th/nvim-cmp" }  --completion plugin
     --use { "hrsh7th/cmp-nvim-lsp" } -- 
     --use { "hrsh7th/cmp-nvim-lua" } -- 
     --use { "hrsh7th/cmp-buffer" }  -- buffer completions?
     --use { "hrsh7th/cmp-path" } --   path completions
     --use { "hrsh7th/cmp-cmdline" } --   command line completions
     --use { "saadparwaiz1/cmp_luasnip" } --   snippet completions


     --use { "L3MON4D3/LuaSnip" } --   snippet engine
     --use { "rafamadriz/friendly-snippets" } --   a bunch of snippets to use

     --use { "neovim/nvim-lspconfig" } -- 
     --use { "williamboman/mason.nvim" } -- 
     --use { "williamboman/mason-lspconfig.nvim" } -- 


   -- new lsp config
   use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
        },                                   -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},         -- Required
      {'hrsh7th/cmp-nvim-lsp'},     -- Required
     { "hrsh7th/cmp-nvim-lua" }, -- 
      {'hrsh7th/cmp-buffer'},       -- Optional
      {'hrsh7th/cmp-path'},         -- Optional
      {"hrsh7th/cmp-cmdline" },
      {'saadparwaiz1/cmp_luasnip'}, -- Optional

      -- Snippets
      {'L3MON4D3/LuaSnip'},             -- Required
      {'rafamadriz/friendly-snippets'}, -- Optional
    }
  }

  -- navigator: new LSP + view symbols etc
  --use {
    --"ray-x/navigator.lua",
    --requires = {
      --{ 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
      --{ 'neovim/nvim-lspconfig' },
    --}
  --}
     --use { "hrsh7th/nvim-cmp" } -- completion plugin
     --use { "hrsh7th/cmp-buffer" } -- buffer completions?
     --use { "hrsh7th/cmp-path" } -- path completions
     --use { "hrsh7th/cmp-cmdline" } -- command line completions
     --use { "saadparwaiz1/cmp_luasnip" } -- snippet completions

    --use { "hrsh7th/cmp-nvim-lsp" }
     --use { "hrsh7th/cmp-nvim-lua" }

     --use { "L3MON4D3/LuaSnip" } -- snippet engine
     --use { "rafamadriz/friendly-snippets" } -- a bunch of snippets to use

    --use { "neovim/nvim-lspconfig" }
     --use { "williamboman/mason.nvim" }
     --use { "williamboman/mason-lspconfig.nvim" }



  -- null-ls needed for prettier
  use { "jose-elias-alvarez/null-ls.nvim" }
  use { "MunifTanjim/prettier.nvim" }

  -- transparent background
  use { "xiyaowong/nvim-transparent" }


  -- ~~~~~~~~~~~~~~~~~~~~~~
  -- utilities
  -- ~~~~~~~~~~~~~~~~~~~~~~

  -- repeat plugin commands with .
  use { "tpope/vim-repeat" }
  -- surrounding " { [ ( etc commands
  use { "tpope/vim-surround" }

  -- auto pairs e.g. "" {} []
  use { "jiangmiao/auto-pairs" }

  -- NERD Commenter easy comments
  -- <leader>cs===fancy comment;
  -- <leader>c+space===toggle line comment;
  -- <leader>cc===comment a line or block
  use { "preservim/nerdcommenter" }

  -- git gutter, some git controls
  --use { "airblade/vim-gitgutter" }
  -- git fugitive - easy git commands
  --use { "tpope/vim-fugitive" }


  -- lualine buffers and tabs
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use { "akinsho/toggleterm.nvim", tag = '*' }

  -- popup display for next key presses available
  use { "folke/which-key.nvim" }



  -- ~~~~~~~~~~~~~~~~~~~~~~
  -- themes
  -- ~~~~~~~~~~~~~~~~~~~~~~
  --
  --use "catppuccin/nvim"
  use "olimorris/onedarkpro.nvim" -- pretty nice!

  -- dracula themes
  --use "dracula/vim" -- brighter than onedarkpro and pretty nice

  use "pacokwon/onedarkhc.vim"

  -- colorbuddy == easily write a custom colorscheme!
  --use "tjdevries/colorbuddy.nvim"
  --use "bbenzikry/snazzybuddy.nvim"

  -- ~~~~~~~~~~~~~~~~~~~~~~
  -- styling
  -- ~~~~~~~~~~~~~~~~~~~~~~
  --
  -- highlight occurrances of the word under the cursor
  use "RRethy/vim-illuminate"
  -- color brackets
  use "HiPhish/nvim-ts-rainbow2"

  -- show indent lines (slow to render large files)
  use "lukas-reineke/indent-blankline.nvim"

  -- colors hex, rgb, etc as the actual color
  use "chrisbra/colorizer"

  -- create an undo tree for easy changing and undoing 
  use "mbbill/undotree"

  --use "jackMort/ChatGPT.nvim"

  -- js extra syntax?
  --use { "pangloss/vim-javascript" }

  --[[
   [  -- jsx pretty  -- NOT NEEDED unless there are errors with `vim-polyglot`!
   [  use "yuezk/vim-js" -- recommended ?
   [  use "HerringtonDarkholme/yats.vim" -- tsx
   [  use "MaxMEllon/vim-jsx-pretty"
   [
   ]]
  -- extra highlighting syntax -- not needed? Treesitter should handle it, use this if needing specific languages
  --use "sheerun/vim-polyglot"
  use {
    "Exafunction/codeium.vim",
    config = function ()
      vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, {expr = true})
    end
  }

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
