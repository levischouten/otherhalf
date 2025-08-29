local palettes = require("otherhalf.palette")
local otherhalf = require("otherhalf")

local function get_palette()
	local variant = "dark"
	if otherhalf.opts then
		if otherhalf.opts.variant == "auto" then
			variant = vim.o.background == "light" and "light" or "dark"
		else
			variant = otherhalf.opts.variant
		end
	end
	return variant == "light" and palettes.light or palettes.dark
end

local function create_theme()
	local p = get_palette()

	local theme = {
		normal = {
			a = { fg = p.bg, bg = p.blue, gui = "bold" },
			b = { fg = p.fg, bg = p.gutter },
			c = { fg = p.fg, bg = p.bg },
		},
		insert = {
			a = { fg = p.bg, bg = p.green, gui = "bold" },
			b = { fg = p.fg, bg = p.gutter },
		},
		visual = {
			a = { fg = p.bg, bg = p.magenta, gui = "bold" },
			b = { fg = p.fg, bg = p.gutter },
		},
		replace = {
			a = { fg = p.bg, bg = p.red, gui = "bold" },
			b = { fg = p.fg, bg = p.gutter },
		},
		command = {
			a = { fg = p.bg, bg = p.yellow, gui = "bold" },
			b = { fg = p.fg, bg = p.gutter },
		},
		inactive = {
			a = { fg = p.br_black, bg = p.bg },
			b = { fg = p.br_black, bg = p.bg },
			c = { fg = p.br_black, bg = p.bg },
		},
	}

	return theme
end

return create_theme()
