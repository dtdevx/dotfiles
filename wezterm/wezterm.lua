-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.color_scheme = 'Catppuccin Mocha'

config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.font_size = 18

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

config.window_background_opacity = 1.0
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 5,
}

config.window_decorations = "RESIZE"

-- Tweak option keys to type ~ with left option key
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = false

config.keys = {
  {
    key = 'n',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = '=',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.DisableDefaultAssignment,
  }
}

-- Alternativley, one can disable ALL default keybindings with:
-- config.disable_default_key_bindings = true

-- and finally, return the configuration to wezterm
return config

