local wezterm = require("wezterm")
local act = wezterm.action
local sessions = require("sessions")

local config = {}

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

config.keys = {
	{
		key = "s",
		mods = "LEADER",
		action = sessions.selectSessionHandler,
	},
	-- PANES
	{
		key = "r",
		mods = "LEADER",
		action = act.ActivateKeyTable({
			name = "resize_pane",
			one_shot = false,
		}),
	},

	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{
		key = "x",
		mods = "LEADER",
		action = act.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "\\",
		mods = "LEADER",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "m",
		mods = "LEADER",
		action = wezterm.action.TogglePaneZoomState,
	},
	-- Copy and Select modes
	{ key = "c", mods = "LEADER", action = act.ActivateCopyMode },
	{ key = "q", mods = "LEADER", action = act.QuickSelect },
}

return config
