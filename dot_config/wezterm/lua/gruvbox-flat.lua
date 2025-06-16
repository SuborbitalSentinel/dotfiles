-- gruvbox-flat-hard
-- Copyright (c) 2024 eddyekofo94
-- repository: https://github.com/eddyekofo94/gruvbox-flat.nvim
-- license: MIT

local M = {}

local palette = {
	-- Hard mode backgrounds
	bg = "#1d2021",
	bg2 = "#17191a",
	bg_highlight = "#3c3836",

	-- Foreground colors
	fg = "#ebdbb2",
	fg_dark = "#a89984",

	-- Gruvbox colors
	red = "#fb4934",
	green = "#b8bb26",
	yellow = "#fabd2f",
	blue = "#83a598",
	purple = "#d3869b",
	cyan = "#8ec07c",
	orange = "#fe8019",

	-- Darker variants
	red_dark = "#cc241d",
	green_dark = "#98971a",
	yellow_dark = "#d79921",
	blue_dark = "#458588",
	purple_dark = "#b16286",
	cyan_dark = "#689d6a",
	orange_dark = "#d65d0e",

	-- Grays
	gray = "#928374",
	gray_dark = "#665c54",
	comment = "#6a635d",
}

local active_tab = {
	bg_color = palette.bg_highlight,
	fg_color = palette.fg,
}

local inactive_tab = {
	bg_color = palette.bg,
	fg_color = palette.fg_dark,
}

function M.colors()
	return {
		foreground = palette.fg,
		background = palette.bg,

		cursor_bg = palette.fg,
		cursor_border = palette.fg,
		cursor_fg = palette.bg,

		selection_bg = palette.bg_highlight,
		selection_fg = palette.fg,

		scrollbar_thumb = palette.bg_highlight,

		ansi = {
			palette.bg, -- black
			palette.red_dark, -- red
			palette.green_dark, -- green
			palette.yellow_dark, -- yellow
			palette.blue_dark, -- blue
			palette.purple_dark, -- magenta
			palette.cyan_dark, -- cyan
			palette.fg_dark, -- white
		},

		brights = {
			palette.gray, -- bright black
			palette.red, -- bright red
			palette.green, -- bright green
			palette.yellow, -- bright yellow
			palette.blue, -- bright blue
			palette.purple, -- bright magenta
			palette.cyan, -- bright cyan
			palette.fg, -- bright white
		},

		-- Additional indexed colors for extended palette
		indexed = {
			[16] = palette.orange, -- bright orange
			[17] = palette.orange_dark, -- dark orange
			[18] = palette.bg2, -- darker background
			[19] = palette.bg_highlight, -- highlight background
			[20] = palette.fg_dark, -- muted foreground
			[21] = palette.fg, -- bright foreground
		},

		tab_bar = {
			background = palette.bg2,
			active_tab = active_tab,
			inactive_tab = inactive_tab,
			inactive_tab_hover = {
				bg_color = palette.bg_highlight,
				fg_color = palette.fg_dark,
			},
			new_tab = inactive_tab,
			new_tab_hover = active_tab,
			inactive_tab_edge = palette.comment,
		},
	}
end

function M.window_frame()
	return {
		active_titlebar_bg = palette.bg,
		inactive_titlebar_bg = palette.bg2,
		active_titlebar_fg = palette.fg,
		inactive_titlebar_fg = palette.fg_dark,
		active_titlebar_border_bottom = palette.bg,
		inactive_titlebar_border_bottom = palette.bg2,
		button_fg = palette.fg_dark,
		button_bg = palette.bg2,
		button_hover_fg = palette.fg,
		button_hover_bg = palette.bg_highlight,
	}
end

return M
