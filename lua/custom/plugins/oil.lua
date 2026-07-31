return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  init = function()
    vim.g.loaded_netrw = true
    vim.g.loaded_netrwPlugin = true

    vim.api.nvim_create_autocmd('VimEnter', {
      once = true,
      callback = function()
        local arg = vim.fn.argv(0)
        if arg ~= '' and vim.fn.isdirectory(arg) == 1 then
          require('oil').open(arg)
        end
      end,
    })
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
