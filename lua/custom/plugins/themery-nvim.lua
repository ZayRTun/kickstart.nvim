return {
  {
    'zaldih/themery.nvim',
    lazy = false,
    config = function()
      require('themery').setup {
        themes = {
          {
            name = 'gruvbox-dark',
            colorscheme = 'gruvbox',
          },
          {
            name = 'rose-pine',
            colorscheme = 'rose-pine',
          },
          {
            name = 'rose-pine-main',
            colorscheme = 'rose-pine',
          },
          {
            name = 'rose-pine-moon',
            colorscheme = 'rose-pine',
          },
          {
            name = 'rose-pine-dawn',
            colorscheme = 'rose-pine',
          },
          {
            name = 'kanagawa-wave',
            colorscheme = 'kanagawa-wave',
          },
          {
            name = 'kanagawa-dragon',
            colorscheme = 'kanagawa-dragon',
          },
          {
            name = 'mellow',
            colorscheme = 'mellow',
          },
          {
            name = 'oldworld',
            colorscheme = 'oldworld',
          },
          {
            name = 'catppuccin frappe',
            colorscheme = 'catppuccin-frappe',
          },
          {
            name = 'catppuccin macchiato',
            colorscheme = 'catppuccin-macchiato',
          },
          {
            name = 'catppuccin mocha',
            colorscheme = 'catppuccin-mocha',
          },
          {
            name = 'catppuccin latte',
            colorscheme = 'catppuccin-latte',
          },
        },
        livePreview = true,
      }
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        transparent_background = true,
      }
    end,
  },
  {
    'dgox16/oldworld.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('oldworld').setup {
        variant = 'oled',
      }
    end,
  },
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = true,
    lazy = false,
    init = function()
      require('gruvbox').setup {
        transparent_mode = true,
      }
    end,
  },
  {
    'rose-pine/neovim',
    priority = 1000,
    lazy = false,
    init = function()
      require('rose-pine').setup {
        styles = {
          bold = true,
          italic = true,
          transparency = true,
        },
      }
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    config = true,
    lazy = false,
    init = function()
      require('kanagawa').setup {
        transparent = true,
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = 'none',
                float = {
                  bg = 'none',
                },
              },
            },
          },
        },

        overrides = function(colors)
          local theme = colors.theme
          return {
            NormalFloat = { bg = 'none' },
            FloatBorder = { bg = 'none' },
            FloatTitle = { bg = 'none' },

            -- Save an hlgroup with dark background and dimmed foreground
            -- so that you can use it where your still want darker windows.
            -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

            -- Popular plugins that open floats will link to NormalFloat by default;
            -- set their background accordingly if you wish to keep them dark and borderless
            LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

            TelescopeTitle = { fg = theme.ui.special, bold = true },
            TelescopePromptNormal = { bg = 'none' },
            TelescopePromptBorder = { fg = 'none', bg = 'none' },
            TelescopeResultsNormal = { bg = 'none' },
            TelescopeResultsBorder = { fg = 'none', bg = 'none' },
            TelescopePreviewNormal = { bg = 'none' },
            TelescopePreviewBorder = { bg = 'none', fg = 'none' },
          }
        end,
      }
    end,
  },
  {
    'mellow-theme/mellow.nvim',
    priority = 1000,
    lazy = false,
    config = function()
      vim.g.mellow_transparent = true
      -- vim.g.mellow_italic_functions = true -- Optional: Enable italic functions
      vim.g.mellow_bold_functions = true -- Optional: Enable bold functions

      -- Apply the colorscheme
      vim.cmd.colorscheme 'mellow'
    end,
  },
}
