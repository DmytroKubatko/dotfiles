local wezterm = require("wezterm")

local selectSessionHandler = wezterm.action_callback(function(window, pane)
	-- Here you can dynamically construct a longer list if needed
	local home = wezterm.home_dir
	local workspaces = {
		{ id = home, label = "Home" },
		{ id = home .. "/code/gap", label = "gap" },
		{ id = home .. "/code/gap-service", label = "gap-service" },
		{ id = home .. "/code/hosted-checkout", label = "hosted-checkout" },
		{ id = home .. "/code/express-checkout-client", label = "express-checkout-client" },
		{ id = home .. "/code/express-checkout-api", label = "express-checkout-api" },
	}
	window:perform_action(
		wezterm.action.InputSelector({
			action = wezterm.action_callback(function(inner_window, inner_pane, id, label)
				if not id and not label then
					wezterm.log_info("cancelled")
				else
					wezterm.log_info("id = " .. id)
					wezterm.log_info("label = " .. label)
					inner_window:perform_action(
						wezterm.action.SwitchToWorkspace({
							name = label,
							spawn = {
								label = "Workspace: " .. label,
								cwd = id,
							},
						}),
						inner_pane
					)
				end
			end),
			title = "Choose Workspace",
			choices = workspaces,
			fuzzy = true,
			-- Nightly version only: https://wezfurlong.org/wezterm/config/lua/keyassignment/InputSelector.html?h=input+selector#:~:text=These%20additional%20fields%20are%20also%20available%3A
			-- fuzzy_description = "Fuzzy find and/or make a workspace",
		}),
		pane
	)
end)

return { selectSessionHandler = selectSessionHandler }
