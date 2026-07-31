# Zayar's Neovim Config

A modular, performance-tuned Neovim configuration built on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) and [lazy.nvim](https://github.com/folke/lazy.nvim). Optimized for **PHP/Laravel**, **Dart/Flutter**, and **Rust** development.

## Requirements

- **Neovim 0.11+** (required for `vim.lsp.config()` API)
- **[Nerd Font](https://www.nerdfonts.com/)** — icons throughout the UI
- **git**, **make**, **ripgrep** — for plugin builds and telescope searching
- **Node.js** — for `blade-formatter` and `prettier-plugin-blade`
- **[Composer](https://getcomposer.org/)** — for Laravel LSP (`composer global require laravel/lsp`)

## Installation

```sh
git clone https://github.com/ZayRTun/kickstart.nvim.git ~/.config/nvim
nvim
```

On first launch, lazy.nvim bootstraps itself and installs all plugins. LSP servers are auto-installed via Mason.

## Structure

```
~/.config/nvim/
├── init.lua                     # Entry point, lazy.nvim bootstrap
├── lazy-lock.json               # Pinned plugin versions (tracked)
├── CONFIG.md                    # Full architecture reference
├── lua/
│   ├── options.lua              # All vim.opt settings
│   ├── keymaps.lua              # Global keymaps
│   ├── custom/
│   │   ├── statuscolumn.lua     # Custom statuscolumn (gradual line numbers)
│   │   └── plugins/             # One file per plugin (auto-imported)
│   └── kickstart/
│       └── plugins/             # autopairs, gitsigns
├── snippets/                    # Custom snippets (PHP, Blade)
└── spell/                       # Spell dictionary
```

## Focus

This config is built for a full-stack developer working primarily with:

- **PHP / Laravel** — Laravel LSP, Pint formatting, Blade formatter, PHP snippets
- **Dart / Flutter** — flutter-tools.nvim with lazy loading
- **Rust** — rust_analyzer via Mason
- **TypeScript / Vue / Svelte** — ts_ls, treesitter grammars

## Key Bindings

Leader key is `<Space>`.

### Navigation

| Key | Action |
|-----|--------|
| `<C-h/j/k/l>` | Move between windows |
| `<S-h/l>` | Previous / next buffer |
| `<C-S-h/j/k/l>` | Resize windows |
| `-` | Open oil.nvim file explorer |
| `<C-e>` | Harpoon file menu |
| `<leader>1-5` | Jump to harpoon marks |

### Search & Find

| Key | Action |
|-----|--------|
| `<leader><leader>` | Find files (Telescope) |
| `<leader>sg` | Live grep |
| `<leader>sw` | Grep word under cursor |
| `<leader>sd` | Diagnostics |
| `<leader>s.` | Recent files |
| `<leader>sb` | Buffers |
| `<leader>/` | Fuzzy search current buffer |
| `<leader>s/` | Live grep open files |
| `<leader>sr` | Find & replace (grug-far) |
| `<CR>` | Flash jump (label-based motion) |

### LSP

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Go to references |
| `gI` | Go to implementation |
| `gD` | Go to declaration |
| `<leader>D` | Type definition |
| `<leader>rn` | Rename |
| `<leader>ca` | Code action |
| `<leader>ds` | Document symbols |
| `<leader>ws` | Workspace symbols |
| `<leader>ih` | Toggle inlay hints |

### Editing

| Key | Action |
|-----|--------|
| `<C-s>` | Save file |
| `<leader>f` | Format buffer |
| `<leader>qq` | Quit all |
| `J` (visual) | Move line down |
| `K` (visual) | Move line up |
| `<C-Up/Down>` | Add multicursor above/below |
| `<leader>n/N` | Add/skip matching cursor |
| `<Esc>` | Clear cursors or clear search |

### Git

| Key | Action |
|-----|--------|
| `<leader>gg` | Lazygit |
| `<leader>gb` | Git blame line |
| `<leader>gl` | Git log |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `]c` / `[c` | Next / previous hunk |

### Toggles (`<leader>u`)

| Key | Action |
|-----|--------|
| `<leader>us` | Spelling |
| `<leader>uw` | Line wrap |
| `<leader>ul` | Line numbers |
| `<leader>uL` | Relative numbers |
| `<leader>uc` | Conceal |
| `<leader>ud` | Diagnostics |
| `<leader>uh` | Inlay hints |
| `<leader>ub` | Dark/light background |
| `<leader>ut` | Notification history |

### Misc

| Key | Action |
|-----|--------|
| `<C-``>` | Toggle terminal |
| `<leader>td` | Search TODO comments |
| `<leader>xx` | Trouble diagnostics |
| `<leader>cR` | Rename file |
| `<leader>bd` | Delete buffer |

## Language & Tool Support

| Language | LSP | Formatter |
|----------|-----|-----------|
| PHP | intelephense + Laravel LSP | Pint |
| Blade | Laravel LSP | blade-formatter |
| Rust | rust_analyzer | — |
| Dart | flutter-tools | — |
| TypeScript / JS | ts_ls | — |
| Lua | lua_ls | stylua |
| HTML / CSS | vscode-html + tailwindcss + emmet | — |
| Python | pyright | — |

## Colorschemes

Switched via `:Themery`. Includes: Catppuccin, Gruvbox, Rose Pine, Kanagawa, Mellow, Oldworld. All with transparent backgrounds.

## Custom Components

- **Statuscolumn** (`lua/custom/statuscolumn.lua`) — Gradual line-number coloring based on distance from cursor, fold icons, git sign rendering. Adapted from LazyVim.
- **Statusline** — lualine with custom layout (mode, diagnostics, filetype icon, filename, location, progress, git branch). No separators.

## Notes

- `lazy-lock.json` is tracked in git for reproducible builds
- All keymaps have `desc` fields for which-key discoverability
- Plugin specs follow lazy.nvim conventions: `opts` for config, `keys` for lazy-load triggers
- For architecture details, see [CONFIG.md](CONFIG.md)
