vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

require 'options'
require 'keymaps'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Plugins
require('lazy').setup({
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',
  -- require 'kickstart.plugins.neo-tree',
  require 'kickstart.plugins.autopairs',
  require 'kickstart.plugins.gitsigns',

  { import = 'custom.plugins' },
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

vim.cmd [[
    autocmd TermOpen * setlocal nospell
]]

local function update_title_with_cwd()
  local parent_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
  local decorated_title = 'Neovim ⚡️ ' .. parent_dir .. ' '
  os.execute('echo -ne "\\033]0;' .. decorated_title .. '\\007"')
end

-- Call the function on Neovim startup
vim.api.nvim_create_autocmd('VimEnter', {
  callback = update_title_with_cwd,
})

require 'custom.statuscolumn'
vim.o.statuscolumn = "%!v:lua.require'custom.statuscolumn'.statuscolumn()"

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
