-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action
-- local mux = wezterm.mux
-- This will hold the configuration.
local config = wezterm.config_builder()
-- local gpus = wezterm.gui.enumerate_gpus()
-- config.webgpu_preferred_adapter = gpus[1]
-- config.front_end = "WebGpu"

config.front_end = "OpenGL"
config.max_fps = 144
config.default_cursor_style = "BlinkingUnderline" -- Set the default cursor style
-- config.enable_scroll_bar = true -- Enable the scroll bar
config.animation_fps = 1
config.cursor_blink_rate = 500
config.term = "xterm-256color" -- Set the terminal type

config.font = wezterm.font("Hack Nerd Font")
-- config.font = wezterm.font("Monocraft Nerd Font")
-- config.font = wezterm.font("FiraCode Nerd Font Mono")
-- config.font = wezterm.font("JetBrains Mono Regular")
config.cell_width = 0.9
-- config.font = wezterm.font("Menlo Regular")
-- config.font = wezterm.font("Hasklig")
-- config.font = wezterm.font("Monoid Retina")
-- config.font = wezterm.font("InputMonoNarrow")
-- config.font = wezterm.font("mononoki Regular")
-- config.font = wezterm.font("Iosevka")
-- config.font = wezterm.font("M+ 1m")
-- config.font = wezterm.font("Hack Regular")
-- config.cell_width = 0.9
config.window_background_opacity = 0.9
config.prefer_egl = true
config.font_size = 13.0

config.window_padding = {
	left = 10,
	right = 0,
	top = 15,
	bottom = 0,
}

-- tabs
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
-- config.tab_bar_at_bottom = true

-- config.inactive_pane_hsb = {
-- 	saturation = 0.0,
-- 	brightness = 1.0,
-- }

-- This is where you actually apply your config choices
--

-- color scheme toggling
wezterm.on("toggle-colorscheme", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if overrides.color_scheme == "Catppuccin Mocha" then
		overrides.color_scheme = "Catppuccin Macchiato"
	else
		overrides.color_scheme = "Catppuccin Mocha"
	end
	window:set_config_overrides(overrides)
end)

-- Add launch menu configurations
config.launch_menu = {
    {
        label = "PowerShell 7",
        args = { "pwsh.exe", "-NoLogo" },
    },
    {
        label = "WSL",
        args = { "wsl.exe" },
    },
    {
        label = "Command Prompt",
        args = { "cmd.exe" },
    },
}


-- keymaps
config.keys = {
	{
        key = "L",
        mods = "WIN|SHIFT",
        action = wezterm.action.ShowLauncher,
    },
	{
        key = "W",
        mods = "WIN|SHIFT", 
        action = wezterm.action.SpawnCommandInNewTab({
            args = { "wsl.exe", "-d", "Ubuntu" },
        }),
    },
	{
		key = "E",
		mods = "CTRL|SHIFT",
		action = wezterm.action.EmitEvent("toggle-colorscheme"),
	},
	{
		key = "h",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitPane({
			direction = "Right",
			size = { Percent = 50 },
		}),
	},
	{
		key = "v",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitPane({
			direction = "Down",
			size = { Percent = 50 },
		}),
	},
	{
		key = "U",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "I",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{
		key = "O",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "P",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},
	{ key = "9", mods = "CTRL", action = act.PaneSelect },
	{ key = "h", mods = "CTRL", action = act.ActivatePaneDirection("Left") },
    { key = "j", mods = "CTRL", action = act.ActivatePaneDirection("Down") },
    { key = "k", mods = "CTRL", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "CTRL", action = act.ActivatePaneDirection("Right") },

	{ key = "Tab", mods = "CTRL", action = act.ActivatePaneDirection("Next") },

	{ key = "P", mods = "CTRL", action = act.ShowDebugOverlay },
	{
		key = "O",
		mods = "CTRL|ALT",
		-- toggling opacity
		action = wezterm.action_callback(function(window, _)
			local overrides = window:get_config_overrides() or {}
			if overrides.window_background_opacity == 1.0 then
				overrides.window_background_opacity = 0.93
			else
				overrides.window_background_opacity = 1.0
			end
			window:set_config_overrides(overrides)
		end),
	},
}

-- For example, changing the color scheme:
config.color_scheme = "Catppuccin Mocha"
-- config.colors = {
-- 	-- background = '#3b224c',
-- 	-- background = "#181616", -- vague.nvim bg
-- 	-- background = "#080808", -- almost black
-- 	background = "#0c0b0f", -- dark purple
-- 	-- background = "#020202", -- dark purple
-- 	-- background = "#17151c", -- brighter purple
-- 	-- background = "#16141a",
-- 	-- background = "#0e0e12", -- bright washed lavendar
-- 	-- background = 'rgba(59, 34, 76, 100%)',
-- 	cursor_border = "#bea3c7",
-- 	-- cursor_fg = "#281733",
-- 	cursor_bg = "#bea3c7",
-- 	-- selection_fg = '#281733',

-- 	tab_bar = {
-- 		background = "#0c0b0f",
-- 		-- background = "rgba(0, 0, 0, 0%)",
-- 		active_tab = {
-- 			bg_color = "#0c0b0f",
-- 			fg_color = "#bea3c7",
-- 			intensity = "Normal",
-- 			underline = "None",
-- 			italic = false,
-- 			strikethrough = false,
-- 		},
-- 		inactive_tab = {
-- 			bg_color = "#0c0b0f",
-- 			fg_color = "#f8f2f5",
-- 			intensity = "Normal",
-- 			underline = "None",
-- 			italic = false,
-- 			strikethrough = false,
-- 		},

-- 		new_tab = {
-- 			-- bg_color = "rgba(59, 34, 76, 50%)",
-- 			bg_color = "#0c0b0f",
-- 			fg_color = "white",
-- 		},
-- 	},
-- }

config.window_frame = {
	font = wezterm.font({ family = "Hack Nerd Font", weight = "Regular" }),
	active_titlebar_bg = "#0c0b0f",
	-- active_titlebar_bg = "#181616",
}

-- config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
config.window_decorations = "NONE | RESIZE"
config.default_prog = { "pwsh.exe", "-NoLogo" }
config.initial_cols = 80
-- config.window_background_image = "C:/dev/misc/berk.png"
-- config.window_background_image_hsb = {
-- 	brightness = 0.1,
-- }

-- wezterm.on("gui-startup", function(cmd)
-- 	local args = {}
-- 	if cmd then
-- 		args = cmd.args
-- 	end
--
-- 	local tab, pane, window = mux.spawn_window(cmd or {})
-- 	-- window:gui_window():maximize()
-- 	-- window:gui_window():set_position(0, 0)
-- end)

-- and finally, return the configuration to wezterm
return config