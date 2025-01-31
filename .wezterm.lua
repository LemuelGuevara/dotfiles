local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- config.color_scheme = "zenwritten_dark"
config.color_scheme = "Classic Dark (base16)"

-- config.font = wezterm.font("SFMono Nerd Font")
config.font = wezterm.font("GeistMono Nerd Font")
-- config.font = wezterm.font("MonaspiceNe Nerd Font")

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
config.max_fps = 240

return config
