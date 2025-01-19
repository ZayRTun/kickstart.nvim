return {
  'numToStr/Comment.nvim',
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
  opts = {
    pre_hook = function(ctx)
      local U = require 'Comment.utils'

      -- Custom logic for Laravel Blade files
      if vim.bo.filetype == 'blade' then
        return ctx.ctype == U.ctype.block and '{{-- %s --}}' or '{{-- %s --}}'
      end

      -- Use ts_context_commentstring for other file types
      local ts_utils = require 'ts_context_commentstring.integrations.comment_nvim'
      return ts_utils.create_pre_hook()(ctx)
    end,
  },
}
