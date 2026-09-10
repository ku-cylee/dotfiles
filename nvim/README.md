# nvim

Neovim configuration based on [LazyVim](https://www.lazyvim.org/), started from the
[LazyVim starter](https://github.com/LazyVim/starter) template.

## Setup

Apply configs by linking this directory to Neovim's config location.

First, `cd` into the directory of this file, i.e. `cd <path-to-this-directory>`. Then,

Windows (cmd):

```
mklink /J "%LOCALAPPDATA%\nvim" "%CD%"
```

Linux:

```
mkdir -p ~/.config
ln -s "$(pwd)" ~/.config/nvim
```

Then just run `nvim` — lazy.nvim bootstraps itself and installs all plugins on first
launch. Language servers and formatters are installed automatically by mason as they
are needed. Run `:checkhealth` to verify the install.

## Requirements

Neovim 0.12+ (latest stable), plus external tools the plugins shell out to:

- **git**, **curl**, **tar** — plugin/parser downloads (preinstalled on Windows 10+ except git)
- A **C compiler** — treesitter parser compilation. Usually preinstalled on Linux
  (`cc`); on Windows only `gcc`/MSVC `cl`/`$CC` pass LazyVim's requirement check —
  zig can compile parsers but fails the check, so use real gcc
  ([WinLibs](https://github.com/brechtsanders/winlibs_mingw/releases))
- **ripgrep** — grep and file finding for the picker
- **fd** — optional, faster file listing for the picker (falls back to ripgrep)
- **Node.js** — required by several language servers
- **PowerShell** (Windows only) — mason runs its installers through it. The built-in
  Windows PowerShell 5 is enough normally; install PowerShell 7 (`pwsh`) only if
  corporate policy blocks spawning PS5 from nvim. It must then be a real exe on
  PATH — nvim does not detect the Microsoft Store alias
- **lazygit** — optional, backs the `<leader>gg` git UI
- A **Nerd Font** for icons — not needed inside WezTerm (it bundles the symbols as
  a fallback font)

On machines where winget is blocked, all of the above ship portable zips on their
GitHub releases pages (Node.js: [nodejs.org](https://nodejs.org/en/download)): extract under `%LOCALAPPDATA%\Programs` (or a single exe into
`~\bin`) and add to the user PATH via `sysdm.cpl` → Environment Variables.

## Files

- `init.lua`: Entry point, boots lazy.nvim.
- `lua/config/`: `options.lua`, `keymaps.lua`, `autocmds.lua` — loaded on top of
  LazyVim defaults; currently all defaults.
- `lua/plugins/`: One file per plugin spec; every file here is merged automatically.
  Add plugins or override defaults of bundled ones here.
- `lazyvim.json`: LazyVim state (enabled extras from `:LazyExtras`).
- `lazy-lock.json`: Plugin version lockfile, tracked so machines can reproduce the
  exact plugin set via `:Lazy restore`.

## Notes

- Plugin data (installed plugins, mason packages, treesitter parsers) lives in
  `%LOCALAPPDATA%\nvim-data` / `~/.local/share/nvim` — machine-local, not tracked.
- `:LazyExtras` toggles language support (LSP + formatter + treesitter per language);
  the selection is saved to `lazyvim.json`.
