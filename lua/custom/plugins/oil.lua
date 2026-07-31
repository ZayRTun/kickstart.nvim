return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  init = function()
    vim.g.loaded_netrw = true
    vim.g.loaded_netrwPlugin = true
  end,
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
