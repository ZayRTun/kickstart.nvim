# Neovim Config Reference

## Overview
Heavily customized [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) config, optimized for **PHP/Laravel + Dart/Flutter + Rust** development. Modular lazy.nvim setup with one plugin spec per file.

## Entry Point
`init.lua` → sets leader (Space), loads `options` + `keymaps`, bootstraps lazy.nvim, then `require('lazy').setup()` auto-imports all specs from `custom.plugins`.

```
init.lua
├── lua/options.lua          # All vim.opt settings
├── lua/keymaps.lua          # Global non-plugin keymaps
├── lua/custom/statuscolumn.lua  # Custom statusline column (LazyVim-inspired)
└── lua/custom/plugins/      # One file per plugin, auto-imported by lazy.nvim
    └── lua/kickstart/plugins/  # Remaining upstream configs (autopairs, gitsigns)
```

## Plugin Manager
**lazy.nvim** with `lazy-lock.json` tracked in git for reproducible builds.

## Key Design Decisions

### Why blink.cmp over nvim-cmp
Faster, built-in tab-out, modern. Migration from nvim-cmp is complete.

### Why oil.nvim over neo-tree
Buffer-based file explorer (`-` to open). netrw disabled by oil itself.

### Why Laravel LSP over blade-nav
First-party Laravel language server (v0.0.29, installed globally via Composer) supersedes `ricardoramirezr/blade-nav.nvim` for Blade completions and navigation. Uses `vim.lsp.config()` + `vim.lsp.enable()` (Neovim 0.11+), same pattern as emmet.

### Why blade-formatter over Pint for Blade
Both use `prettier-plugin-blade` under the hood. `blade-formatter` supports custom formatting options (wrap-line-length, preserve-aligned) that Pint's `--blade` flag doesn't expose. Pint handles PHP formatting only.

## LSP Architecture
Two patterns coexist:
- **Mason-managed servers** (pyright, rust_analyzer, ts_ls, intelephense, html, tailwindcss, lua_ls) → handled by `mason-lspconfig` with auto-install
- **Externally managed servers** (laravel-lsp, emmet_language_server) → direct `vim.lsp.config()` + `vim.lsp.enable()`

Capabilities from `blink.cmp`. LSP keymaps attached on `LspAttach` via buffer-local mappings with `desc` fields.

## Formatters (conform.nvim)
| Filetype | Formatter |
|----------|-----------|
| lua | stylua |
| blade | blade-formatter (custom args: wrap-line-length 9999, preserve-aligned) |
| php | pint |

Format on save enabled. Manual trigger: `<leader>f`.

## Snippets
Engine: LuaSnip with friendly-snippets + custom snipmate snippets in `snippets/` (php.snippets, blade.snippets).

## Colorschemes
Managed by `themery.nvim`. Themes: catppuccin, gruvbox, rose-pine, kanagawa, mellow, oldworld. All transparent backgrounds enabled. **Only themery has `lazy = false`; individual themes are lazy-loaded.** The mellow theme race condition (explicit `colorscheme` call) was fixed — only themery sets the active theme.

## Key Plugins

| Category | Plugin | Notes |
|----------|--------|-------|
| Completion | blink.cmp | `enter` keymap preset, sources: lsp, buffer, snippets, path, lazydev |
| Fuzzy finder | telescope.nvim | fzf-native sorter, ui-select integration |
| Navigation | flash.nvim | `<CR>` for jump, `<C-CR>` for treesitter |
| File marks | harpoon | lazy-loaded via keys, `<C-e>` menu, `<leader>1-5` marks |
| Multi-cursor | multicursor.nvim | `<C-Up>`/`<C-Down>` add cursors, `<leader>n`/`<leader>m` match skip |
| File explorer | oil.nvim | `-` opens, eager-loaded (not lazy) |
| Git | gitsigns, snacks (lazygit) | `]c`/`[c` hunks, `<leader>gg` lazygit |
| Surround | nvim-surround | |
| Comments | Comment.nvim | nvim-ts-context-commentstring for tree-sitter aware commenting |
| Statusline | lualine.nvim | Custom sections, no separators |
| Notifications | snacks.notifier + noice.nvim | `cmdheight=0` delegates to noice |
| Find & replace | grug-far.nvim | `<leader>sr` |
| Diagnostics | trouble.nvim | `<leader>xx` |
| Todo highlighting | todo-comments.nvim | `<leader>td` telescope search |
| Auto pairs | nvim-autopairs | |
| Indent detection | vim-sleuth | |
| UI utils | snacks.nvim | bigfile, dashboard, notifier, statuscolumn, words, terminal toggle |
| Keybinding hints | which-key.nvim | All keymaps have `desc` fields |
| Icons | mini.icons + nvim-web-devicons | |

## Important Keymaps
- `<leader>` = Space
- `<C-s>` = Save file
- `<C-h/j/k/l>` = Window navigation
- `<C-S-h/j/k/l>` = Resize windows
- `<S-h/l>` = Previous/next buffer
- `<C-``>` = Toggle terminal (snacks)
- `<leader>sh/sk/sg/sd/s./sb` = Telescope searches
- `<leader>rn/ca/gd/gr/gI` = LSP actions
- `-` = Open oil.nvim

## Which-key Groups
`<leader>c`, `<leader>d`, `<leader>r`, `<leader>s`, `<leader>w`, `<leader>t`, `<leader>h`, `<leader>u`, `<leader>q`, `<leader>R`, `<leader>b`

## Tags
- `pre-overhaul` — tagged before the July 2026 config audit and optimization pass. Revert with `git checkout pre-overhaul`.

## Maintenance Notes
- Plugin specs use lazy.nvim conventions: `opts` for config, `keys` for lazy-load triggers, `ft`/`event`/`cmd` for deferred loading
- `init` (not `config`) runs at startup; use for setting globals/vim.g before plugin loads
- `config` runs when plugin actually loads; use for `require().setup()` calls
- LSP keymaps inside `LspAttach` autocmd use a local `map()` helper that adds `buffer` and `LSP:` prefix
- Snacks toggle maps are set up in `VeryLazy` autocmd to ensure the global exists
- `.stylua.toml` enforces Lua formatting
