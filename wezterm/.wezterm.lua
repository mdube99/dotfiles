--
-- wezterm - customisable terminal emulator
--

local wez = require 'wezterm'
--
-- EVENTS
wez.on('format-window-title', function()
	return 'wezterm'
end)

-- CONFIG
return {
	-- FONTS
	font = wez.font_with_fallback {
		{ family = 'JetBrains Mono', weight = 'Medium', scale = 1.1 },
		'Noto Sans Regular',
	},
	font_size = 12,
	warn_about_missing_glyphs = false,
	line_height = 1.0,
	dpi = 96.0,
	harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' },
	-- APPEARANCE
	enable_tab_bar = false,
	color_scheme = 'tokyodark',
	bold_brightens_ansi_colors = true,
	window_padding = {
		left = 5,
		right = 5,
		top = 5,
		bottom = 5,
	},
	-- Settings
	window_close_confirmation = "NeverPrompt", -- by default, will ask if you're sure you wanna quit.
}
