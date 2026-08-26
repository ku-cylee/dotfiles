# wezterm

WezTerm configuration.

## Setup

Apply configs by linking this directory to `~/.config/wezterm`.

First, `cd` into the directory of this file, i.e. `cd <path-to-this-directory>`. Then,

Windows (cmd):

```
if not exist "%USERPROFILE%\.config" mkdir "%USERPROFILE%\.config"
mklink /J "%USERPROFILE%\.config\wezterm" "%CD%"
```

Linux:

```
mkdir -p ~/.config
ln -s "$(pwd)" ~/.config/wezterm
```

## Files

- `wezterm.lua`: Shared config (theme, fonts, cursor, keybindings) synced across machines.
- `local.lua`: Machine-specific local config, **not tracked by git**. Everything works fine without it.

## local.lua

Build and return a config table; it gets merged at the end of `wezterm.lua`.

```lua
local config = {}

config.front_end = 'OpenGL'
config.font_size = 11

return config
```

Note: the merge **overwrites top-level keys**. Defining a table key like `keys` or `colors` in local.lua replaces the entire table from the shared config. Use it only to override scalar values.

## Fonts

Font files are not included in this repo, so manual installation of the two fonts below is required. WezTerm silently falls back to the bundled JetBrains Mono if not installed.

- **Geist Mono** (primary): https://github.com/vercel/geist-font/releases
- **Sarasa Term K** (Korean fallback): `SarasaTermK-TTF-<version>.7z` (hinted) from https://github.com/be5invis/Sarasa-Gothic/releases

Note: Run `wezterm ls-fonts` to verify and check that both fonts appear in the font chain.
