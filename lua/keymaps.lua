-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Remain cursor at place when joining lines
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Remain cursor in place when joining line' })

-- Keep search terms in the middle
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Keep search terms in the middle' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Keep search terms in the middle' })

-- quit
vim.keymap.set('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit all' })

-- windows
vim.keymap.set('n', '<leader>ww', '<C-W>p', { desc = 'Other window', remap = true })
vim.keymap.set('n', '<leader>wd', '<C-W>c', { desc = 'Delete window', remap = true })
vim.keymap.set('n', '<leader>w-', '<C-W>s', { desc = 'Split window below', remap = true })
vim.keymap.set('n', '<leader>w|', '<C-W>v', { desc = 'Split window right', remap = true })
vim.keymap.set('n', '<leader>-', '<C-W>s', { desc = 'Split window below', remap = true })
vim.keymap.set('n', '<leader>|', '<C-W>v', { desc = 'Split window right', remap = true })

-- Resize window using <ctrl> arrow keys
vim.keymap.set('n', '<C-S-K>', '<cmd>resize +2<cr>', { desc = 'Increase window height' })
vim.keymap.set('n', '<C-S-J>', '<cmd>resize -2<cr>', { desc = 'Decrease window height' })
vim.keymap.set('n', '<C-S-h>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease window width' })
vim.keymap.set('n', '<C-S-l>', '<cmd>vertical resize +2<cr>', { desc = 'Increase window width' })

-- Move highlighted lines up/down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move highlighted line down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move highlighted line up' })

-- Navigate buffers
vim.keymap.set('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next buffer' })
vim.keymap.set('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Prev buffer' })
vim.keymap.set('n', '<leader>`', '<cmd>e #<cr>', { desc = 'Switch to Other Buffer' })

-- save file
vim.keymap.set({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })

-- better indenting
vim.keymap.set('v', '<', '<gv', { desc = 'De-indent and keep selection' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent and keep selection' })

vim.keymap.set('x', '<leader>p', '"_dp', { desc = 'Paste yanked without overriding' })
vim.keymap.set('n', '<leader>rp', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/g<Left><Left><Left>]], { desc = 'Replace in current line using vim regex' })
vim.keymap.set('n', '<leader>Rp', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Replace all using vim regex' })
