local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

lualine.setup({
  options = {
    always_divide_middle = true,
    icons_enabled = false,
    theme = "auto",
    --section_separators = { left = '', right = '' },
    --component_separators = { left = '', right = '' },
    --  component_separators = { left = '', right = '' }, -- default
    --section_separators = { left = '', right = '' },   -- default
    ignore_focus = { 'NvimTree' },
    globalstatus = true,
  },
  sections = {
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
          return math.floor((vim.o.columns * 3 / 5) + 0.5)
        end,
        filetype_names = {
          --TelescopePrompt = 'Telescope',
          dashboard = 'Dashboard',
          packer = 'Packer',
          fzf = 'FZF',
          alpha = 'Alpha'
        }, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )

        ---- Automatically updates active buffer color to match color of other components (will be overidden if buffers_color is set)
        use_mode_colors = true,

        symbols = {
          modified = ' ●',    -- Text to show when the buffer is modified
          alternate_file = '#', -- Text to show to identify the alternate file
          directory = '',    -- Text to show when the buffer is a directory
        },
      }
    },
    lualine_b = {
      'diff', 'diagnostics',
    },
    lualine_c = {}, -- filename
    lualine_x = {
      'selectioncount',
      {
        'branch',
        icons_enabled = true,
        --separator = { left = '', right = ''},
        icon = {'', align='right', color={fg='green'}},
      },
      --'encoding',
      --'fileformat',
      --'filetype'
      --
    },
    lualine_y = {
      'progress'
    },
    lualine_z = {
      {
        'location',
        padding = { left = 0, right = 0 },
      },
      {
        'datetime',
        --style = 'default', -- us, uk, iso, "%H:%M"
        --style = "%H:%M %D",
        style = "%D | %H:%M",
        color = { fg = 252, bg = 235, gui = "bold" }
      }
    },
  }
})
