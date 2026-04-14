local wezterm = require 'wezterm'
local config = wezterm.config_builder()
config.automatically_reload_config = true 

config.color_scheme = 'AdventureTime'
config.font_size = 14
config.use_ime = true
config.window_background_opacity = 0.8
config.macos_window_background_blur = 20

config.window_decorations = "RESIZE"

return config
