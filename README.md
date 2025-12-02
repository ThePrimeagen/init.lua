# Neovim Configuration

A powerful Neovim configuration with LSP, Telescope, Harpoon, and more.

Originally forked from [ThePrimeagen's init.lua](https://github.com/ThePrimeagen/init.lua).

## Features

- **LSP Support** - Full language server support with Mason auto-installer
- **Fuzzy Finding** - Telescope for file and text searching
- **Git Integration** - Fugitive for git commands + Gitsigns for inline changes
- **Quick Navigation** - Harpoon for instant file switching
- **Statusline** - Lualine with git, diagnostics, and file info
- **Which-Key** - Popup showing available keybindings as you type
- **File Explorer** - Oil.nvim for intuitive file management
- **Autocomplete** - nvim-cmp with LSP integration
- **Syntax Highlighting** - Treesitter for better code highlighting
- **Diagnostics** - Trouble for pretty diagnostic lists
- **Testing** - Neotest integration for running tests
- **And more!** - Undotree, Zen mode, snippets, and more

## Prerequisites

Before installing this configuration, you need to have the following installed on your Mac:

### Required Dependencies

1. **Neovim** (version 0.9.0 or later)
   ```bash
   brew install neovim
   ```

2. **ripgrep** (required for Telescope grep functionality)
   ```bash
   brew install ripgrep
   ```

3. **Git**
   ```bash
   brew install git
   ```

4. **Node.js** (required for LSP servers)
   ```bash
   brew install node
   ```

5. **A Nerd Font** (for icons)
   - Download and install a Nerd Font from [nerdfonts.com](https://www.nerdfonts.com/)
   - Popular choices: JetBrainsMono Nerd Font, FiraCode Nerd Font
   - Configure your terminal to use the Nerd Font

### Optional Dependencies

- **tmux** and **tmux-sessionizer** (if you want to use the tmux integration keybindings)
  ```bash
  brew install tmux
  ```

## Installation

1. **Backup your existing Neovim configuration** (if you have one):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   mv ~/.local/share/nvim ~/.local/share/nvim.backup
   ```

2. **Clone this repository**:
   ```bash
   git clone git@github.com:snirsh/init.lua.git ~/.config/nvim
   ```

3. **Start Neovim**:
   ```bash
   nvim
   ```

4. **Install plugins**:
   - The plugin manager (lazy.nvim) will automatically bootstrap on first launch
   - Plugins will be installed automatically
   - LSP servers will be installed automatically via Mason when you first open a file of that type

5. **Wait for everything to install**:
   - Let Mason install the language servers (lua_ls, rust_analyzer, gopls, ts_ls, eslint)
   - This may take a few minutes on first launch

6. **Restart Neovim** to ensure everything is loaded correctly

## Language Servers

The following language servers are configured to auto-install via Mason:

- **lua_ls** - Lua
- **rust_analyzer** - Rust
- **gopls** - Go
- **ts_ls** - TypeScript/JavaScript
- **eslint** - ESLint integration (auto-fix on save)
- **zls** - Zig (manual configuration)

## Custom Keybindings

Leader key is set to `Space`.

### General Navigation & Editing

| Mode | Keybinding | Action |
|------|-----------|--------|
| n | `<leader>pv` | Open file explorer (Oil) |
| n | `-` | Open file explorer (Oil) in parent directory |
| v | `J` | Move selected line(s) down |
| v | `K` | Move selected line(s) up |
| n | `J` | Join lines without moving cursor |
| n | `<C-d>` | Half page down, center cursor |
| n | `<C-u>` | Half page up, center cursor |
| n | `n` | Next search result, center cursor |
| n | `N` | Previous search result, center cursor |
| n | `=ap` | Format paragraph and return to cursor position |
| x | `<leader>p` | Paste without yanking replaced text |
| n/v | `<leader>y` | Yank to system clipboard |
| n | `<leader>Y` | Yank line to system clipboard |
| n/v | `<leader>d` | Delete without yanking |
| i | `<C-c>` | Exit insert mode (same as Esc) |
| n | `Q` | Disabled (no-op) |
| n | `<leader>s` | Search and replace word under cursor |
| n | `<leader>x` | Make current file executable |
| n | `<leader><leader>` | Source current file |

### Telescope (Fuzzy Finder)

| Mode | Keybinding | Action |
|------|-----------|--------|
| n | `<leader>pf` | Find files |
| n | `<C-p>` | Find files (alternative) |
| n | `<leader>ps` | Grep search (prompt) |
| n | `<leader>pws` | Grep search word under cursor |
| n | `<leader>pWs` | Grep search WORD under cursor |
| n | `<leader>vh` | Search help tags |

### Harpoon (Quick File Navigation)

| Mode | Keybinding | Action |
|------|-----------|--------|
| n | `<leader>a` | Add file to Harpoon |
| n | `<leader>A` | Prepend file to Harpoon |
| n | `<C-e>` | Toggle Harpoon quick menu |
| n | `<C-h>` | Navigate to Harpoon file 1 |
| n | `<C-t>` | Navigate to Harpoon file 2 |
| n | `<C-n>` | Navigate to Harpoon file 3 |
| n | `<C-s>` | Navigate to Harpoon file 4 |
| n | `<leader><C-h>` | Replace Harpoon slot 1 with current file |
| n | `<leader><C-t>` | Replace Harpoon slot 2 with current file |
| n | `<leader><C-n>` | Replace Harpoon slot 3 with current file |
| n | `<leader><C-s>` | Replace Harpoon slot 4 with current file |

### LSP (Language Server Protocol)

These keybindings are available when an LSP server is attached to the buffer.

| Mode | Keybinding | Action |
|------|-----------|--------|
| n | `gd` | Go to definition |
| n | `K` | Show hover documentation |
| n | `<leader>vws` | Search workspace symbols |
| n | `<leader>vd` | Show diagnostic float |
| n | `<leader>vca` | Code action |
| n | `<leader>vrr` | Show references |
| n | `<leader>vrn` | Rename symbol |
| i | `<C-h>` | Signature help |
| n | `[d` | Next diagnostic |
| n | `]d` | Previous diagnostic |
| n | `<leader>zig` | Restart LSP server |

### LSP Autocomplete (Insert Mode)

| Mode | Keybinding | Action |
|------|-----------|--------|
| i | `<Tab>` | Next completion item |
| i | `<S-Tab>` | Previous completion item |
| i | `<CR>` | Confirm selection |
| i | `<C-Space>` | Trigger completion |

### Git (Fugitive)

| Mode | Keybinding | Action |
|------|-----------|--------|
| n | `<leader>gs` | Git status |
| n | `gu` | Get changes from left (during merge conflict) |
| n | `gh` | Get changes from right (during merge conflict) |

**In Fugitive buffer only:**

| Mode | Keybinding | Action |
|------|-----------|--------|
| n | `<leader>p` | Git push |
| n | `<leader>P` | Git pull with rebase |
| n | `<leader>t` | Git push and set upstream (prompts for branch) |

### Git Signs (Inline Git Changes)

| Mode | Keybinding | Action |
|------|-----------|--------|
| n | `]c` | Next hunk (git change) |
| n | `[c` | Previous hunk (git change) |
| n | `<leader>hs` | Stage hunk |
| n | `<leader>hr` | Reset hunk |
| v | `<leader>hs` | Stage selected lines |
| v | `<leader>hr` | Reset selected lines |
| n | `<leader>hS` | Stage entire buffer |
| n | `<leader>hR` | Reset entire buffer |
| n | `<leader>hu` | Undo stage hunk |
| n | `<leader>hp` | Preview hunk |
| n | `<leader>hb` | Show full blame for line |
| n | `<leader>tb` | Toggle inline git blame |
| n | `<leader>hd` | Diff this file |
| n | `<leader>hD` | Diff this file against HEAD~ |
| n | `<leader>td` | Toggle deleted lines view |
| o/x | `ih` | Select hunk (text object) |

### Undotree

| Mode | Keybinding | Action |
|------|-----------|--------|
| n | `<leader>u` | Toggle Undotree |

### Zen Mode

| Mode | Keybinding | Action |
|------|-----------|--------|
| n | `<leader>zz` | Toggle Zen mode (90 width, with line numbers) |
| n | `<leader>zZ` | Toggle Zen mode (80 width, no line numbers) |

### Trouble (Diagnostics)

| Mode | Keybinding | Action |
|------|-----------|--------|
| n | `<leader>tt` | Toggle Trouble diagnostics |
| n | `[t` | Next trouble item |
| n | `]t` | Previous trouble item |

### Quickfix & Location List

| Mode | Keybinding | Action |
|------|-----------|--------|
| n | `<C-k>` | Next quickfix item |
| n | `<C-j>` | Previous quickfix item |
| n | `<leader>k` | Next location list item |
| n | `<leader>j` | Previous location list item |

### Terminal

| Mode | Keybinding | Action |
|------|-----------|--------|
| n | `<leader>tv` | Open terminal in vertical split |
| n | `<leader>th` | Open terminal in horizontal split (bottom) |
| t | `<leader><Esc>` | Exit terminal mode to normal mode |

### Tmux Integration (if tmux-sessionizer is installed)

| Mode | Keybinding | Action |
|------|-----------|--------|
| n | `<C-f>` | Open tmux-sessionizer in new window |
| n | `<M-h>` | Open tmux-sessionizer in vsplit (silent) |
| n | `<M-H>` | Open tmux-sessionizer in new window (silent) |

### Go Error Handling Snippets

| Mode | Keybinding | Action |
|------|-----------|--------|
| n | `<leader>ee` | Insert `if err != nil { return err }` |
| n | `<leader>ea` | Insert `assert.NoError(err, "")` |
| n | `<leader>ef` | Insert `if err != nil` with log.Fatalf |
| n | `<leader>el` | Insert `if err != nil` with logger.Error |

### Testing (Neotest)

| Mode | Keybinding | Action |
|------|-----------|--------|
| n | `<leader>tc` | Run nearest test |
| n | `<leader>tf` | Run test file (Plenary) |

### Fun Extras

| Mode | Keybinding | Action |
|------|-----------|--------|
| n | `<leader>ca` | Cellular automaton animation (make it rain) |

### Oil File Explorer (Within Oil buffer)

| Keybinding | Action |
|-----------|--------|
| `<CR>` | Open file/directory |
| `<C-v>` | Open in vertical split |
| `<C-s>` | Open in horizontal split |
| `<C-t>` | Open in new tab |
| `<C-p>` | Preview file |
| `<C-c>` | Close Oil |
| `<C-r>` | Refresh |
| `-` | Go to parent directory |
| `_` | Open cwd |
| `` ` `` | CD into directory |
| `~` | CD into directory (tab-local) |
| `g?` | Show help |
| `gs` | Change sort order |
| `gx` | Open with system default application |
| `g.` | Toggle hidden files |
| `g\` | Toggle trash |

## Additional Notes

- The colorscheme automatically switches between `rose-pine-moon` (default) and `tokyonight-night` (for Zig files)
- 2-space indentation is automatically set for JavaScript, TypeScript, HTML, CSS, and JSON files
- 4-space indentation for other files
- Trailing whitespace is automatically removed on save
- ESLint auto-fix runs on save for JavaScript/TypeScript files
- Undo history is persisted to `~/.vim/undodir`
- **Which-Key** popup appears after 300ms when you start a key sequence (e.g., press `<leader>` and wait)
- **Lualine** statusline shows mode, git branch, diagnostics, file info, and more at the bottom
- **Gitsigns** adds git change indicators in the sign column (gutter) for modified/added/deleted lines

## Troubleshooting

### Plugins not loading
```bash
rm -rf ~/.local/share/nvim
nvim
```

### LSP not working
- Open Mason with `:Mason` and ensure language servers are installed
- Check LSP status with `:LspInfo`
- Restart LSP with `<leader>zig`

### Icons not showing
- Make sure you have a Nerd Font installed and configured in your terminal

## Resources

- [Original video tutorial by ThePrimeagen](https://www.youtube.com/watch?v=w7i4amO_zaE)
- [ThePrimeagen's original repository](https://github.com/ThePrimeagen/init.lua)
