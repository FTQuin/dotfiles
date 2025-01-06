-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- config.color_scheme = 'Monokai Dark (Gogh)'
-- config.color_scheme = 'Monokai Vivid'
-- config.color_scheme = 'Mono Green (Gogh)'
config.color_scheme = "Tokyo Night (Gogh)"

config.font = wezterm.font("JetBrains Mono")
config.font_size = 16

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

config.window_background_opacity = 0.1
config.macos_window_background_blur = 50

-- KEY BINDINGS
config.keys = {
	-- Turn off the default CMD-m Hide action, allowing CMD-m to
	-- be potentially recognized and handled by the tab
	{
		key = "m",
		mods = "CMD",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "LeftArrow",
		mods = "CMD",
		action = { SendKey = { key = "a", mods = "CTRL" } },
	},
	{
		key = "RightArrow",
		mods = "CMD",
		action = { SendKey = { key = "e", mods = "CTRL" } },
	},
	{
		key = "Delete",
		mods = "ALT",
		action = { SendKey = { key = "w", mods = "CTRL" } },
	},
	{
		key = "LeftArrow",
		mods = "ALT",
		action = { SendKey = { key = "b", mods = "ALT" } },
	},
	{
		key = "RightArrow",
		mods = "ALT",
		action = { SendKey = { key = "f", mods = "ALT" } },
	},
	{
		key = "Backspace",
		mods = "CMD",
		action = { SendKey = { key = "U", mods = "CTRL" } },
	},
}

-- and finally, return the configuration to wezterm
return config
