return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  enabled = true,
  event = 'Colorscheme',
  init = function()
    local lualine = require 'lualine'

    lualine.setup {
      options = {
        theme = 'auto',
        section_separators = { left = ' ', right = ' ' },
        component_separators = { left = ' ', right = ' ' },
      },

      sections = {
        lualine_a = {
          { 'mode' },
        },
        lualine_b = {},
        lualine_c = {
          {
            'diagnostics',
            symbols = {
              error = ' ',
              warn = ' ',
              info = ' ',
              hint = '󰠠 ',
            },
          },
          {
            'filetype',
            icon_only = true,
            padding = { left = 1, right = 0 },
          },
          {
            'filename',
            file_status = true,
            newfile_status = false,
            path = 1,
            shorting_target = 40,
            symbols = {
              modified = '[+]', -- Text to show when the file is modified.
              readonly = '[-]', -- Text to show when the file is non-modifiable or readonly.
              unnamed = '[No Name]', -- Text to show for unnamed buffers.
              newfile = '[New]', -- Text to show for newly created file before first write
            },
          },
        },
        lualine_x = {
          -- {
          --   lazy_status.updates,
          --   cond = lazy_status.has_updates,
          --   color = { fg = t_colors.orange_500 },
          -- },
          { 'location' },
          { 'progress' },
          { 'selectioncount' },
          { 'encoding' },
          { 'branch' },
        },
        lualine_y = {},
        lualine_z = {},
      },

      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
    }
  end,
}
