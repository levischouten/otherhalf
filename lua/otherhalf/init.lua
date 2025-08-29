local palettes = require("otherhalf.palette")
local hl = require("otherhalf.highlights")

local M = {}
M.opts = {
	variant = "auto", -- "auto" | "dark" | "light"
	transparent = false,
	italics = true,
}

function M.setup(opts)
	M.opts = vim.tbl_deep_extend("force", M.opts, opts or {})
	
	-- Clear any existing autocommands for this theme
	vim.api.nvim_create_augroup("OtherHalfTheme", { clear = true })
	
	-- Auto-reload theme when background changes (only if variant is "auto")
	if M.opts.variant == "auto" then
		vim.api.nvim_create_autocmd("OptionSet", {
			group = "OtherHalfTheme",
			pattern = "background",
			callback = function()
				if vim.g.colors_name == "otherhalf" then
					vim.defer_fn(function()
						M.load()
					end, 0)
				end
			end,
		})
	end
end

local function get_variant()
	if M.opts.variant == "auto" then
		return vim.o.background == "light" and "light" or "dark"
	end
	return M.opts.variant
end

function M.load()
	local variant = get_variant()
	local p = (variant == "light") and palettes.light or palettes.dark
	vim.g.colors_name = "otherhalf"
	hl.apply(p, M.opts)
	
	-- Refresh lualine if it's loaded
	local ok, lualine = pcall(require, "lualine")
	if ok then
		lualine.refresh()
	end
end

function M.toggle()
	if M.opts.variant == "auto" then
		vim.o.background = vim.o.background == "light" and "dark" or "light"
	else
		M.opts.variant = M.opts.variant == "light" and "dark" or "light"
		M.load()
	end
end

function M.debug()
	print("OtherHalf Debug Info:")
	print("  Current variant setting:", M.opts.variant)
	print("  Current vim.o.background:", vim.o.background)
	print("  Detected variant:", get_variant())
	print("  Current colorscheme:", vim.g.colors_name)
	print("  Transparent:", M.opts.transparent)
	print("  Italics:", M.opts.italics)
end

return M
