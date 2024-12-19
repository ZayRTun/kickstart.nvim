return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  config = function()
    require('oil').setup {
      keymaps = {
        ['<C-v>'] = false,
      },

      watch_for_changes = true,

      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' }),
    }
  end,
}
