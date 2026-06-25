# Neovim Config

Personal Neovim configuration built around Lua modules for plugins, editor settings, keymaps, LSP support, completion, file navigation, terminal workflows, and UI customization.

## What This Includes

- Modular Lua configuration split into `config/` and `plugins/`.
- LSP and completion setup.
- Telescope for fuzzy finding.
- Treesitter for syntax-aware editing.
- Neo-tree for file navigation.
- Toggleterm for integrated terminal workflows.
- Harpoon for fast project navigation.
- Lualine, Noice, Barbar, Alpha dashboard, and custom color configuration.

## Structure

```text
init.lua              Entry point
lua/config/          Core editor settings, keymaps, LSP, completion
lua/plugins/         Plugin-specific configuration
plugin/              Compiled/generated plugin output
stylua.toml          Lua formatting configuration
```

## Installation

Back up your existing Neovim config first:

```bash
mv ~/.config/nvim ~/.config/nvim.backup
```

Clone this config:

```bash
git clone https://github.com/vortexisalpha/nvim-config ~/.config/nvim
```

Open Neovim and let the plugin manager install dependencies:

```bash
nvim
```

## Notes

This is a personal development environment rather than a general-purpose distribution. Plugin choices and keymaps are optimized for my workflow across systems programming, Python, C/C++, web development, and terminal-heavy work.
