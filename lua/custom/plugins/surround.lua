return { -- Surround stuffs
  'kylechui/nvim-surround',
  event = { 'BufReadPre', 'BufNewFile' },
  enabled = true,
  version = '*', -- Use for stability; omit to use `main` branch for the latest features
  config = true,
}
