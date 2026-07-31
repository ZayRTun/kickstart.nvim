return {
  'jake-stewart/multicursor.nvim',
  branch = '1.0',
  config = function()
    local mc = require 'multicursor-nvim'

    mc.setup()

    local set = vim.keymap.set

    -- Add or skip cursor above/below the main cursor.
    set({ 'n', 'v' }, '<C-Up>', function()
      mc.lineAddCursor(-1)
    end, { desc = 'Add cursor above' })
    set({ 'n', 'v' }, '<C-Down>', function()
      mc.lineAddCursor(1)
    end, { desc = 'Add cursor below' })
    set({ 'n', 'v' }, '<C-S-Up>', function()
      mc.lineSkipCursor(-1)
    end, { desc = 'Skip cursor above' })
    set({ 'n', 'v' }, '<C-S-Down>', function()
      mc.lineSkipCursor(1)
    end, { desc = 'Skip cursor below' })

    -- Add or skip adding a new cursor by matching word/selection
    set({ 'n', 'v' }, '<leader>n', function()
      mc.matchAddCursor(1)
    end, { desc = 'Add Cursor' })
    set({ 'n', 'v' }, '<leader>m', function()
      mc.matchSkipCursor(1)
    end, { desc = 'Skip Cursor' })
    set({ 'n', 'v' }, '<leader>N', function()
      mc.matchAddCursor(-1)
    end, { desc = 'Add Cursor (prev)' })
    set({ 'n', 'v' }, '<leader>M', function()
      mc.matchSkipCursor(-1)
    end, { desc = 'Skip Cursor (prev)' })

    -- Add all matches in the document
    set({ 'n', 'v' }, '<leader>A', mc.matchAllAddCursors, { desc = 'Add all match cursors' })

    -- You can also add cursors with any motion you prefer:
    -- set("n", "<right>", function()
    --     mc.addCursor("w")
    -- end)
    -- set("n", "<leader><right>", function()
    --     mc.skipCursor("w")
    -- end)



    -- Delete the main cursor.
    set({ 'n', 'v' }, '<leader>x', mc.deleteCursor, { desc = 'Delete cursor' })

    -- Add and remove cursors with control + left click.
    set('n', '<c-leftmouse>', mc.handleMouse, { desc = 'Mouse cursor' })

    -- Easy way to add and remove cursors using the main cursor.
    set({ 'n', 'v' }, '<c-q>', mc.toggleCursor, { desc = 'Toggle cursor' })

    -- Clone every cursor and disable the originals.
    set({ 'n', 'v' }, '<leader><c-q>', mc.duplicateCursors, { desc = 'Duplicate cursors' })

    set('n', '<esc>', function()
      if not mc.cursorsEnabled() then
        mc.enableCursors()
      elseif mc.hasCursors() then
        mc.clearCursors()
      else
        -- Default <esc> handler.
        vim.cmd 'nohlsearch'
      end
    end, { desc = 'Clear cursors / Enable cursors' })

    -- bring back cursors if you accidentally clear them
    set('n', '<leader>gv', mc.restoreCursors, { desc = 'Restore cursors' })

    -- Align cursor columns.
    set('v', '<leader>a', mc.alignCursors, { desc = 'Align cursors' })

    -- Split visual selections by regex.
    set('v', 'S', mc.splitCursors, { desc = 'Split cursors by regex' })

    -- Append/insert for each line of visual selections.
    set('v', 'I', mc.insertVisual, { desc = 'Insert at cursors' })
    set('v', 'A', mc.appendVisual, { desc = 'Append at cursors' })

    -- match new cursors within visual selections by regex.
    set('v', 'M', mc.matchCursors, { desc = 'Match cursors by regex' })

    -- Rotate visual selection contents.
    set('v', '<leader>t', function()
      mc.transposeCursors(1)
    end, { desc = 'Transpose cursors forward' })
    set('v', '<leader>T', function()
      mc.transposeCursors(-1)
    end, { desc = 'Transpose cursors backward' })

    -- Jumplist support
    set({ 'v', 'n' }, '<c-i>', mc.jumpForward, { desc = 'Jump cursor forward' })
    set({ 'v', 'n' }, '<c-o>', mc.jumpBackward, { desc = 'Jump cursor backward' })

    -- Customize how cursors look.
    local hl = vim.api.nvim_set_hl
    hl(0, 'MultiCursorCursor', { link = 'Cursor' })
    hl(0, 'MultiCursorVisual', { link = 'Visual' })
    hl(0, 'MultiCursorSign', { link = 'SignColumn' })
    hl(0, 'MultiCursorDisabledCursor', { link = 'Visual' })
    hl(0, 'MultiCursorDisabledVisual', { link = 'Visual' })
    hl(0, 'MultiCursorDisabledSign', { link = 'SignColumn' })
  end,
}
