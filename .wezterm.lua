-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "zenwritten_dark"

config.font = wezterm.font("SFMono Nerd Font")

if wezterm.targe_triple == "x86_64-unknown-linux-gnu" then
	config.font_size = 13
else
	config.font_size = 15
end

config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"
config.enable_wayland = false
config.window_padding = {
	left = "5px",
	right = "5px",
	top = "14px",
	bottom = "0px",
}

-- and finally, return the configuration to wezterm
return config
