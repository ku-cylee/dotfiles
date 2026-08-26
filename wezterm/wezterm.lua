local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Material Darker (base16)'
config.colors = {
  cursor_border = wezterm.color.get_builtin_schemes()[config.color_scheme].background,
}

config.font = wezterm.font_with_fallback {
  { family = 'Geist Mono', harfbuzz_features = { 'ss11=1' } },
  'Sarasa Term K',
}

config.cursor_blink_rate = 0
config.default_cursor_style = 'SteadyBar'

config.keys = {
  { key = 'phys:Minus', mods = 'CTRL|SHIFT', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = 'phys:Backslash', mods = 'CTRL|SHIFT', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 'q', mods = 'CTRL|SHIFT', action = wezterm.action.CloseCurrentPane { confirm = true } },
}

local ok, overrides = pcall(require, 'local')
if ok then
  for k, v in pairs(overrides) do
    config[k] = v
  end
end

return config
