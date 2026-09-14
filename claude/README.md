# claude

[Claude Code](https://claude.com/claude-code) user-level configuration.

## Setup

Link each file in this directory to `~/.claude/`.

First, `cd` into the directory of this file, i.e. `cd <path-to-this-directory>`. Then,

Windows (cmd):

```
if not exist "%USERPROFILE%\.claude" mkdir "%USERPROFILE%\.claude"
if exist "%USERPROFILE%\.claude\CLAUDE.md" del "%USERPROFILE%\.claude\CLAUDE.md"
mklink /H "%USERPROFILE%\.claude\CLAUDE.md" "%CD%\CLAUDE.md"
```

Windows (pwsh):

```
New-Item -ItemType Directory -Force "$env:USERPROFILE\.claude" | Out-Null
Remove-Item -Force "$env:USERPROFILE\.claude\CLAUDE.md" -ErrorAction SilentlyContinue
New-Item -ItemType HardLink -Path "$env:USERPROFILE\.claude\CLAUDE.md" -Target "$PWD\CLAUDE.md"
```

Linux:

```
mkdir -p ~/.claude
ln -f "$(pwd)/CLAUDE.md" ~/.claude/CLAUDE.md
```

## Files

- `CLAUDE.md`: User-level instructions loaded into every Claude Code session.
