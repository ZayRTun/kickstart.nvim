return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
    -- stylua: ignore
    config = function()
      local harpoon = require 'harpoon'

      harpoon:setup {}

      vim.keymap.set('n', '<leader>a', function() harpoon:list():add() end, { desc = 'Add to Harpoon' })
      vim.keymap.set('n', '<C-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'View Harpoon menu' })
      vim.keymap.set('n', '<leader>1', function() harpoon:list():select(1) end, { desc = 'Goto Harpoon 1' })
      vim.keymap.set('n', '<leader>2', function() harpoon:list():select(2) end, { desc = 'Goto Harpoon 2' })
      vim.keymap.set('n', '<leader>3', function() harpoon:list():select(3) end, { desc = 'Goto Harpoon 3' })
      vim.keymap.set('n', '<leader>4', function() harpoon:list():select(4) end, { desc = 'Goto Harpoon 4' })
      vim.keymap.set('n', '<leader>5', function() harpoon:list():select(5) end, { desc = 'Goto Harpoon 5' })
    end,
}
