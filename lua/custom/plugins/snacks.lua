return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    scratch = { enabled = false },
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    styles = {
      notification = {
        wo = { wrap = true }, -- Wrap notifications
      },
    },
  },
  -- stylua: ignore
  keys = {
    { '<leader>ut', function() if _G.Snacks and _G.Snacks.notifier then _G.Snacks.notifier.show_history() end end, desc = 'Notification History'},
    { '<leader>bd', function() if _G.Snacks and _G.Snacks.bufdelete then _G.Snacks.bufdelete() end end, desc = 'Delete Buffer'},
    { '<leader>cR', function() if _G.Snacks and _G.Snacks.rename then _G.Snacks.rename.rename_file() end end, desc = 'Rename File'},
    { '<leader>gB', function() if _G.Snacks and _G.Snacks.gitbrowse then _G.Snacks.gitbrowse() end end, desc = 'Git Browse' },
    { '<leader>gb', function() if _G.Snacks and _G.Snacks.git then _G.Snacks.git.blame_line() end end, desc = 'Git Blame Line'},
    { '<leader>gf', function() if _G.Snacks and _G.Snacks.lazygit then _G.Snacks.lazygit.log_file() end end, desc = 'Lazygit Current File History'},
    { '<leader>gg', function() if _G.Snacks and _G.Snacks.lazygit then _G.Snacks.lazygit() end end, desc = 'Lazygit'},
    { '<leader>gl', function() if _G.Snacks and _G.Snacks.lazygit then _G.Snacks.lazygit.log() end end, desc = 'Lazygit Log (cwd)'},
    { '<leader>un', function() if _G.Snacks and _G.Snacks.notifier then _G.Snacks.notifier.hide() end end, desc = 'Dismiss All Notifications'},
    { ']]', function() if _G.Snacks and _G.Snacks.words then _G.Snacks.words.jump(vim.v.count1) end end, desc = 'Next Reference', mode = { 'n', 't' }},
    { '[[', function() if _G.Snacks and _G.Snacks.words then _G.Snacks.words.jump(-vim.v.count1) end end, desc = 'Prev Reference', mode = { 'n', 't' }},

    -- Modified Terminal Toggle Keymappings
    {
      '<c-`>',
      function()
        if _G.Snacks and _G.Snacks.terminal then
          _G.Snacks.terminal()
        else
          vim.notify("Snacks.nvim terminal component not available.", vim.log.levels.WARN)
        end
      end,
      mode = "n", -- Explicitly for Normal mode
      desc = 'Toggle Terminal (Normal Mode)'
    },
    {
      '<c-`>',
      -- When in terminal mode:
      -- 1. <C-\><C-n>: Exit terminal insert mode to terminal-normal mode.
      -- 2. <Cmd>lua ... <CR>: Execute the Lua command to call the toggle function.
      "<C-\\><C-n><Cmd>lua if _G.Snacks and _G.Snacks.terminal then _G.Snacks.terminal() else vim.notify('Snacks.nvim terminal component not available.', vim.log.levels.WARN) end<CR>",
      mode = "t", -- Explicitly for Terminal mode
      desc = 'Toggle Terminal (Terminal Mode)'
    },
  },
  init = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        -- Ensure Snacks global is available (lazy.nvim usually handles this for `folke/snacks.nvim` -> global Snacks)
        -- Adding safety checks for _G.Snacks for robustness.
        if not _G.Snacks then
          -- If Snacks is not globally available for some reason, try requiring it.
          -- This is usually not needed if lazy.nvim sets up the global based on plugin name.
          _G.Snacks = require 'snacks'
        end

        -- Setup some globals for debugging (lazy-loaded)
        if _G.Snacks and _G.Snacks.debug then
          _G.dd = function(...)
            _G.Snacks.debug.inspect(...)
          end
          _G.bt = function()
            _G.Snacks.debug.backtrace()
          end
          vim.print = _G.dd -- Override print to use snacks for `:=` command
        end

        -- Create some toggle mappings
        if _G.Snacks and _G.Snacks.toggle then
          _G.Snacks.toggle.option('spell', { name = 'Spelling' }):map '<leader>us'
          _G.Snacks.toggle.option('wrap', { name = 'Wrap' }):map '<leader>uw'
          _G.Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map '<leader>uL'
          _G.Snacks.toggle.diagnostics():map '<leader>ud'
          _G.Snacks.toggle.line_number():map '<leader>ul'
          _G.Snacks.toggle.option('conceallevel', { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map '<leader>uc'
          _G.Snacks.toggle.treesitter():map '<leader>uT'
          _G.Snacks.toggle.option('background', { off = 'light', on = 'dark', name = 'Dark Background' }):map '<leader>ub'
          _G.Snacks.toggle.inlay_hints():map '<leader>uh'
        end
      end,
    })
  end,
}
