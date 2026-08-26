# clink

[Clink](https://github.com/chrisant996/clink) configuration — makes `cmd.exe` use bash-style
line editing and tab completion. Windows only, no Linux equivalent.

## Setup

1. Install Clink if not already installed:

```
winget install --id chrisant996.Clink -e
```

2. Register Clink to auto-load in every new `cmd.exe` (one-time, per machine, stored in the registry — not covered by the file link below):

```
clink autorun install
```

3. Link `clink_settings` in this directory to Clink's profile location. `mklink /H` creates a hardlink (no admin rights needed, unlike a symlink).

First, `cd` into the directory of this file, i.e. `cd <path-to-this-directory>`. Then:

```
if not exist "%LOCALAPPDATA%\clink" mkdir "%LOCALAPPDATA%\clink"
del "%LOCALAPPDATA%\clink\clink_settings"
mklink /H "%LOCALAPPDATA%\clink\clink_settings" "%CD%\clink_settings"
```

4. Open a new `cmd.exe` window to pick up the settings.

## Files

- `clink_settings`: Shared settings (key bindings, colors) synced across machines.

## Notes

- `clink_history` and `clink.log` also live in `%LOCALAPPDATA%\clink` but are machine-local
  session data, not tracked here.
- Key settings in this file:
  - `clink.default_bindings = bash`: bash-style Tab completion (complete common prefix, then
    list candidates) instead of cmd's default cycling behavior.
  - `clink.colorize_input = False` / `color.input = default`: keeps the typed input line
    plain, like real bash. Only the completion candidate list is colored (via the
    `color.executable` / `color.readonly` / etc. entries below, based on the "4-bit Enhanced
    Defaults" theme bundled with Clink).
