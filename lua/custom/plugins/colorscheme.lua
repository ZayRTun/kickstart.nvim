--[[ return   {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    init = function()
      require('gruvbox').setup {
        transparent_mode = true,
      }
      -- vim.cmd.colorscheme 'gruvbox'
    end,
  }, ]]

return {
  'rose-pine/neovim',
  name = 'rose-pine',
  init = function()
    require('rose-pine').setup {
      styles = {
        bold = true,
        italic = true,
        transparency = true,
      },
    }
    vim.cmd.colorscheme 'rose-pine'
    -- vim.cmd 'colorscheme rose-pine-main'
    -- vim.cmd 'colorscheme rose-pine-moon'
    -- vim.cmd 'colorscheme rose-pine-dawn'
  end,
}
