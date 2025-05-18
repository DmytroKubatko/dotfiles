local wezterm = require("wezterm")
local lib = require("lib")
local windowConfig = require("window")
local fontConfig = require("font")
local formatTitle = require("format-title")
local keysConfig = require("keys")
local keyTables = require("key-tables")

local config = lib.mergeTables(windowConfig, fontConfig, formatTitle, keysConfig, keyTables)

wezterm.on("gui-startup", function(cmd)
	-- Get the list of screens
	local screen = wezterm.gui.screens().active

	-- Get the dimensions of the active screen
	local screen_width = screen.width
	local screen_height = screen.height

	local window_width = 180

	-- Create a new window with the specified position and size
	local tab, pane, window = wezterm.mux.spawn_window({
		position = {
			x = screen_width / 2 + window_width,
			y = screen_height / 2,
		},
		width = window_width,
		height = 90,
	})
end)

return config
