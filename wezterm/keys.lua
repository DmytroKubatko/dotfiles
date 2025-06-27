local wezterm = require("wezterm")
local act = wezterm.action

local config = {}

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

config.keys = {
	-- Meta+hjkl for direct pane navigation
	{ key = "h", mods = "META", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "META", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "META", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "META", action = act.ActivatePaneDirection("Right") },

	-- Meta+- and Meta+\ for pane splitting
	{ key = "-", mods = "META", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "\\", mods = "META", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

	{
		key = "x",
		mods = "META",
		action = act.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "m",
		mods = "META",
		action = wezterm.action.TogglePaneZoomState,
	},
	-- Copy and Select modes
	{ key = "c", mods = "META", action = act.ActivateCopyMode },
	{ key = "q", mods = "META", action = act.QuickSelect },
}

return config
