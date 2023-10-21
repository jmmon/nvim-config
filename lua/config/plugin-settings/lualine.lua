local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

lualine.setup({
  options = {
    -- always_divide_middle = true,
    icons_enabled = false,
    theme = "auto",
    -- section_separators = {left = '|', right = '|'},
    -- component_separators = {left = '', right = ''},

    --section_separators = { left = '', right = '' },
    --component_separators = { left = '', right = '' },
    --
    section_separators = { left = '', right = '' }, -- default
    component_separators = { left = '', right = '' }, -- default
    --
    ignore_focus = {
      'NvimTree',
      -- 'minimap',
    },
    globalstatus = true,
    -- disabled_filetypes = {},
  },
  sections = {
    -- left half:
    lualine_a = {
      --{ 'mode', fmt = function(str) return str:sub(1,1) end },
      {
        'buffers',
        show_filename_only = true,       -- Shows shortened relative path when set to false.
        hide_filename_extension = false, -- Hide filename extension when set to true.
        show_modified_status = true,     -- Shows indicator when the buffer is modified.
        padding = { left = 1, right = 0 },

        mode = 4, -- 0: Shows buffer name
        -- 1: Shows buffer index
        -- 2: Shows buffer name + buffer index
        -- 3: Shows buffer number
        -- 4: Shows buffer name + buffer number

        --max_length = vim.o.columns * 2 / 3,
        -- it can also be a function that returns
        -- the value of `max_length` dynamically.
        max_length = function() -- Maximum width of buffers component,
          -- looks like this works well for smaller screens
          -- say width is 50: we want this to cover maybe 25 columns, or ~50% of the screen
          -- say width is 150: we want this to cover probably all but 25 columns, so 5/6 of the screen
          -- return math.floor((vim.o.columns * 2 / 5) + 20.5)
          return math.max(
            vim.o.columns * 0.5,
            vim.o.columns - 60
          )
        end,
        filetype_names = {
          --TelescopePrompt = 'Telescope',
          dashboard = 'Dashboard',
          packer = 'Packer',
          fzf = 'FZF',
          alpha = 'Alpha',
          minimap = '** -- MINIMAP -- **',
        }, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )

        ---- Automatically updates active buffer color to match color of other components (will be overidden if buffers_color is set)
        use_mode_colors = true,

        symbols = {
          modified = ' ●', -- Text to show when the buffer is modified
          alternate_file = '#', -- Text to show to identify the alternate file
          directory = '', -- Text to show when the buffer is a directory
        },
      }
    },
    lualine_b = {
      -- {
      --   'diff',
      --   padding = { left = 1, right = 0 },
      -- },
      -- {
      --   'diagnostics',
      --   padding = { left = 1, right = 0 },
      -- },
    },
    lualine_c = {}, -- filename

    -- right half:
    -- selection count
    lualine_x = {

      -- show count of selected cols/lines
      {
        'selectioncount',
        padding = { left = 1, right = 1 },
        -- color = { fg = 252,  bg = 238, gui = "bold" },
        -- separator = { left = '', right = ''},
        -- color={}
      },
    },
    -- gh diff, diagnostics
    lualine_y = {
      -- github diff count
      {
        'diff',
        padding = { left = 0, right = 1 },
        color = { bg = 0, gui = "bold" },
        -- color = {  bg = 252, gui = "bold" },
        -- separator = { left = '', right = ''},
      },
      -- counts of diagnostics issues
      -- test

      -- ,,,

      {
        'diagnostics',
        padding = { left = 1, right = 1 },
        symbols = {
          hint = "#:",
          info = "?:",
          warn = "!:",
          error = "X:",
        },
        -- color = {  bg = 234, gui = "bold" },

        -- separator = { left = '', right = '' },   -- default
        -- separator = { left = '', right = ''},
      },
      -- git branch
      -- {
      --   'branch',
      --   icons_enabled = true,
      --   padding = { left = 0, right = 1 },
      --   --separator = { left = '', right = ''},
      --   -- separator = {left = '|', right = '|'},
      --   icon = { '', align = 'right', color = { fg = 'green' } },
      -- },
      --'encoding',
      --'fileformat',
      --'filetype'
      --

    },
    -- file progress, gh branch
    lualine_z = {

      -- percent progress in file
      {
        'progress',

        padding = { left = 0, right = 1 },
      },
      -- cols:rows
      {
        'location',
        padding = { left = 0, right = 1 },
      },

      -- git branch
      {
        'branch',
        icons_enabled = true,
        padding = { left = 0, right = 1 },
        --separator = { left = '', right = ''},
        -- separator = {left = '|', right = '|'},
        icon = { '', align = 'right', },
      },

      {
        "filesize",
        padding = { left = 1, right = 0 },
        color = {
          fg = 244,
          bg = 234,
          -- gui = "bold"
        },
      },

      -- date
      {
        'datetime',
        --style = 'default', -- us, uk, iso, "%H:%M"
        --style = "%H:%M %D",
        style = "%D",
        color = { fg = 252, bg = 234, gui = "bold" },
        padding = { left = 1, right = 0 },
      },
      -- separator
      {
        'datetime',
        --style = 'default', -- us, uk, iso, "%H:%M"
        --style = "%H:%M %D",
        style = "|",
        color = { fg = 238, bg = 234, gui = "bold" },
        padding = { left = 0, right = 0 },
      },
      -- time
      {
        'datetime',
        --style = 'default', -- us, uk, iso, "%H:%M"
        --style = "%H:%M %D",
        style = "%H:%M",
        color = { fg = 252, bg = 234, gui = "bold" },
        padding = { left = 0, right = 0 },
      }
    },
  }
})
