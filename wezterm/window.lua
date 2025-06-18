local config = {}

config.initial_cols = 160
config.initial_rows = 70

config.window_padding = {
	left = 0,
	right = 0,
	top = 10,
	bottom = 10,
}

config.color_scheme = "Tokyo Night"

-- control inactive pane dimming
config.inactive_pane_hsb = {
	hue = 1.0,
	saturation = 1.0,
	brightness = 0.5,
}

return config
