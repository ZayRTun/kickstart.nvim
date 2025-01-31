-- Highlight todo, notes, etc in comments
return {
  'folke/todo-comments.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' }, -- Ensure Telescope is included
  opts = {
    signs = true, -- Enable signs for TODO comments in the gutter
    keywords = {
      FIX = { icon = ' ', color = 'error', alt = { 'Fix' } },
      TODO = { icon = ' ', color = 'info', alt = { 'Todo' } },
      HACK = { icon = ' ', color = 'warning', alt = { 'Hack' } },
      WARN = { icon = ' ', color = 'warning', alt = { 'Warn' } },
      PERF = { icon = ' ', alt = { 'Perf' } },
      NOTE = { icon = '', color = 'hint', alt = { 'Note' } },
    },
  },
  config = function(_, opts)
    require('todo-comments').setup(opts) -- Apply the configuration
    -- vim.keymap.set('n', '<leader>td', '<cmd>Trouble todo<cr>', { desc = 'Open Todo comments with Telescope' })
    vim.keymap.set('n', '<leader>td', '<cmd>TodoTelescope<cr>', { desc = 'Open Todo comments with Telescope' })
  end,
}
