local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.audible_bell = "Disabled"
config.font = wezterm.font_with_fallback({ "0xProto Nerd Font Mono", "Symbols Nerd Font" })
config.font_size = 22

config.colors = require("lua/gruvbox-flat").colors()
config.window_frame = require("lua/gruvbox-flat").window_frame()

config.hide_tab_bar_if_only_one_tab = true

config.default_prog = { "nu.exe" }

config.leader = { key = "z", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{
		key = "F11",
		action = wezterm.action.ToggleFullScreen,
	},
	{
		key = "w",
		mods = "LEADER",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
	{
		key = "o",
		mods = "LEADER",
		action = wezterm.action.RotatePanes("Clockwise"),
	},
	{
		key = "o",
		mods = "LEADER|SHIFT",
		action = wezterm.action.RotatePanes("CounterClockwise"),
	},
	{
		key = "h",
		mods = "ALT",
		action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "l",
		mods = "ALT",
		action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
	},
	{
		key = "j",
		mods = "ALT",
		action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
	},
	{
		key = "k",
		mods = "ALT",
		action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "l",
		mods = "LEADER|SHIFT",
		action = wezterm.action.SplitPane({
			direction = "Right",
			size = { Percent = 50 },
		}),
	},
	{
		key = "h",
		mods = "LEADER|SHIFT",
		action = wezterm.action.SplitPane({
			direction = "Left",
			size = { Percent = 50 },
		}),
	},
	{
		key = "j",
		mods = "LEADER|SHIFT",
		action = wezterm.action.SplitPane({
			direction = "Down",
			size = { Percent = 50 },
		}),
	},
	{
		key = "k",
		mods = "LEADER|SHIFT",
		action = wezterm.action.SplitPane({
			direction = "Up",
			size = { Percent = 50 },
		}),
	},
	{
		key = "l",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "h",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "j",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "{",
		mods = "CTRL|SHIFT",
		action = wezterm.action.MoveTabRelative(-1),
	},
	{
		key = "}",
		mods = "CTRL|SHIFT",
		action = wezterm.action.MoveTabRelative(1),
	},
}

return config
