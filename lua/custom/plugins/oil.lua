return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    keymaps = {
      ['<C-s>'] = false,
      ['<C-v>'] = { 'actions.select', opts = { vertical = true } },
    },
    watch_for_changes = true,
  },
  keys = {
    { '-', '<CMD>Oil<CR>', desc = 'Open parent directory' },
  },
}
