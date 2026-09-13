# powershell

PowerShell profile — configures [PSReadLine](https://github.com/PowerShell/PSReadLine) for
vi-style line editing and bash-style tab completion. Windows only.

PSReadLine settings are runtime commands, not persisted state, so they live in the profile
script (`$PROFILE`) that runs on every shell start — same concept as `.bashrc`.

## Setup

Link `Microsoft.PowerShell_profile.ps1` in this directory to the profile location. `mklink /H`
creates a hardlink (no admin rights needed, unlike a symlink).

The commands below are for **cmd** (`%VAR%` expansion and `mklink` are cmd built-ins; they
will not run in PowerShell). First, `cd` into the directory of this file, i.e.
`cd <path-to-this-directory>`. Then:

PowerShell 7 (`pwsh`) — cmd:

```
if not exist "%USERPROFILE%\Documents\PowerShell" mkdir "%USERPROFILE%\Documents\PowerShell"
if exist "%USERPROFILE%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" del "%USERPROFILE%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
mklink /H "%USERPROFILE%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" "%CD%\Microsoft.PowerShell_profile.ps1"
```

Windows PowerShell 5.1 (optional, cmd — profile paths differ per version, but the settings work on
both since PSReadLine ships with 5.1 too):

```
if not exist "%USERPROFILE%\Documents\WindowsPowerShell" mkdir "%USERPROFILE%\Documents\WindowsPowerShell"
if exist "%USERPROFILE%\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1" del "%USERPROFILE%\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
mklink /H "%USERPROFILE%\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1" "%CD%\Microsoft.PowerShell_profile.ps1"
```

Open a new PowerShell window to pick up the settings.

## Files

- `Microsoft.PowerShell_profile.ps1`: Shared profile (PSReadLine options) synced across machines.

## Notes

- If Documents is redirected (e.g. OneDrive on corporate machines), the paths above may be
  wrong — run `$PROFILE` in PowerShell to see the real location.
- Command history lives in `%APPDATA%\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt`
  but is machine-local session data, not tracked here.
- Key settings in this file:
  - `Set-PSReadLineOption -EditMode Vi`: vim-style modal editing on the command line. The
    prompt starts in insert mode; `Esc` enters normal mode for editing. Must come first — it
    resets the keymap, so later key handlers would otherwise be overwritten.
  - `Set-PSReadLineKeyHandler -Key Tab -Function Complete`: bash-style Tab completion
    (complete common prefix, then list candidates) instead of the default cycling behavior.
    Same behavior as `clink.default_bindings = bash` in the clink config.
