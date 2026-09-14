# pwsh

PowerShell 7 profile — configures [PSReadLine](https://github.com/PowerShell/PSReadLine) for
vi-style line editing and bash-style tab completion.

## Setup

Link `Microsoft.PowerShell_profile.ps1` to `$PROFILE`.

First, `cd` into the directory of this file, i.e. `cd <path-to-this-directory>`. Then,

Windows (cmd):

```
if not exist "%USERPROFILE%\Documents\PowerShell" mkdir "%USERPROFILE%\Documents\PowerShell"
if exist "%USERPROFILE%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" del "%USERPROFILE%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
mklink /H "%USERPROFILE%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" "%CD%\Microsoft.PowerShell_profile.ps1"
```

Windows (pwsh):

```
New-Item -ItemType Directory -Force "$env:USERPROFILE\Documents\PowerShell" | Out-Null
Remove-Item -Force "$env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" -ErrorAction SilentlyContinue
New-Item -ItemType HardLink -Path "$env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" -Target "$PWD\Microsoft.PowerShell_profile.ps1"
```

Linux:

```
mkdir -p ~/.config/powershell
ln -f "$(pwd)/Microsoft.PowerShell_profile.ps1" ~/.config/powershell/Microsoft.PowerShell_profile.ps1
```

If the paths above don't match, run `$PROFILE` in pwsh to see the real location.

## Files

- `Microsoft.PowerShell_profile.ps1`: Shared profile (PSReadLine options) synced across machines.
  - `Set-PSReadLineOption -EditMode Vi`: vi-style modal editing. Must come first — it resets
    the keymap, so later key handlers would otherwise be overwritten.
  - `Set-PSReadLineKeyHandler -Key Tab -Function Complete`: bash-style Tab completion, same as
    `clink.default_bindings = bash` in the clink config.
