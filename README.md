<div align="center">

```
 ██████╗ ███╗   ██╗██╗   ██╗██╗███╗   ███╗
 ╚═══██╗ ████╗  ██║██║   ██║██║████╗ ████║
  █████╔╝ ██╔██╗ ██║██║   ██║██║██╔████╔██║
  ╚═══██╗ ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
 ██████╔╝ ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
 ╚═════╝  ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
```

### A personal Neovim configuration for full‑stack Laravel & Flutter development

[![Neovim](https://img.shields.io/badge/Neovim-0.11+-57A143?logo=neovim&logoColor=white)](https://neovim.io)
[![Lua](https://img.shields.io/badge/Lua-blue?logo=lua&logoColor=white)](https://www.lua.org)
[![Based on kickstart.nvim](https://img.shields.io/badge/based_on-kickstart.nvim-5c2d91)](https://github.com/nvim-lua/kickstart.nvim)

</div>

---

Built on **[kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)** and heavily customized with a modular plugin architecture, LSP‑first workflows, and a polished UI — all tailored for PHP/Laravel, Dart/Flutter, and Rust development.

---

## ✨ Highlights

- **Modular** — one file per plugin, auto‑imported by lazy.nvim
- **Fast** — plugins lazy‑loaded by event, key, or filetype
- **Laravel‑first** — first‑party Laravel LSP, Pint, Blade formatter, custom snippets
- **Beautiful** — transparent themes, custom statuscolumn, noice.nvim UI
- **Discoverable** — every keymap has a `desc` for which‑key hints

## 📋 Requirements

| Tool | Why |
|------|-----|
| **Neovim 0.11+** | `vim.lsp.config()` API |
| **[Nerd Font](https://www.nerdfonts.com/)** | Icons throughout the UI |
| **git** · **make** · **ripgrep** | Plugin builds & telescope |
| **Node.js** | blade‑formatter |
| **[Composer](https://getcomposer.org/)** | Laravel LSP (`composer global require laravel/lsp`) |

## 🚀 Install

```sh
git clone https://github.com/ZayRTun/kickstart.nvim.git ~/.config/nvim
nvim
```

Lazy.nvim bootstraps itself on first launch. LSP servers install automatically via Mason.  
Want to revert? `git checkout pre-overhaul` restores the last stable snapshot.

## 📁 Structure

```
~/.config/nvim/
├── init.lua                      # Entry point
├── lazy-lock.json                # Pinned plugin versions
├── README.md
├── CONFIG.md                     # Architecture deep-dive
├── lua/
│   ├── options.lua               # vim.opt settings
│   ├── keymaps.lua               # Global keymaps
│   └── custom/
│       ├── statuscolumn.lua      # Custom line‑number column
│       └── plugins/              # One spec per plugin
├── snippets/                     # PHP & Blade snippets
└── spell/                        # Spell dictionary
```

## 🎯 Languages

| Language | LSP | Formatter |
|----------|-----|-----------|
| **PHP** | intelephense + Laravel LSP | Pint |
| **Blade** | Laravel LSP | blade‑formatter |
| **Rust** | rust_analyzer | — |
| **Dart** | flutter‑tools | — |
| **TypeScript / JS** | ts_ls | — |
| **Lua** | lua_ls | stylua |
| **Python** | pyright | — |
| **HTML / CSS** | html + tailwindcss + emmet | — |

## ⌨️ Key Bindings

Leader is `<Space>`. Every mapping appears in which‑key.

### 🔭 Navigation

| Key | Action |
|-----|--------|
| `<C-h/j/k/l>` | Move between windows |
| `<S-h/l>` | Previous / next buffer |
| `<C-S-h/j/k/l>` | Resize windows |
| `-` | Oil file explorer |
| `<C-e>` | Harpoon menu |
| `<leader>1-5` | Harpoon marks |

### 🔍 Search

| Key | Action |
|-----|--------|
| `<leader><leader>` | Find files |
| `<leader>sg` | Live grep |
| `<leader>sw` | Grep word |
| `<leader>sd` | Diagnostics |
| `<leader>s.` | Recent files |
| `<leader>sb` | Buffers |
| `<leader>/` | Fuzzy search buffer |
| `<leader>sr` | Find & replace (grug‑far) |
| `<CR>` | Flash jump |

### 🧠 LSP

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | References |
| `gI` | Implementation |
| `<leader>rn` | Rename |
| `<leader>ca` | Code action |
| `<leader>ds` | Document symbols |
| `<leader>ws` | Workspace symbols |
| `<leader>ih` | Toggle inlay hints |

### ✏️ Editing

| Key | Action |
|-----|--------|
| `<C-s>` | Save |
| `<leader>f` | Format |
| `<C-Up/Down>` | Multicursor add |
| `<leader>n/N` | Multicursor match / skip |
| `<Esc>` | Clear cursors or search |

### 🔀 Git

| Key | Action |
|-----|--------|
| `<leader>gg` | Lazygit |
| `<leader>gb` | Blame line |
| `<leader>gl` | Git log |
| `<leader>hs/hr` | Stage / reset hunk |
| `]c` / `[c` | Next / prev hunk |

### ⚙️ Toggles (`<leader>u`)

| Key | Toggle |
|-----|--------|
| `us` | Spelling |
| `uw` | Wrap |
| `ul` / `uL` | Line numbers / Relative |
| `uc` | Conceal |
| `ud` | Diagnostics |
| `uh` | Inlay hints |
| `ub` | Dark / light |
| `ut` | Notification history |

### 🧩 Misc

| Key | Action |
|-----|--------|
| `<C-``>` | Terminal |
| `<leader>td` | TODO comments |
| `<leader>xx` | Trouble diagnostics |
| `<leader>cR` | Rename file |
| `<leader>bd` | Delete buffer |

## 🎨 Colorschemes

`:Themery` cycles through **Catppuccin**, **Gruvbox**, **Rose Pine**, **Kanagawa**, **Mellow**, and **Oldworld**. All with transparent backgrounds.

## 🧱 Built With

| Category | Plugin |
|----------|--------|
| Package manager | lazy.nvim |
| Completion | blink.cmp + LuaSnip |
| Fuzzy finder | telescope + fzf‑native |
| LSP | nvim‑lspconfig + mason |
| Formatting | conform.nvim |
| File explorer | oil.nvim |
| Motion | flash.nvim + multicursor |
| Git | gitsigns + snacks.lazygit |
| UI | noice + lualine + which‑key + trouble |
| Utilities | snacks.nvim (dashboard, terminal, notifier, bigfile) |

## 📖 More

- Full architecture reference → [CONFIG.md](CONFIG.md)
- Config audit & changelog → `git log`
- Stable snapshot tag → `pre-overhaul`
