local palettes = require("otherhalf.palette")
local hl = require("otherhalf.highlights")

local M = {}
M.opts = {
	variant = "auto", -- "auto" | "dark" | "light"
	transparent = false,
	italics = true,
	integrations = {
		neotree = { enabled = true },
		render_markdown = { enabled = true },
	},
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
				vim.defer_fn(function()
					M.load()
				end, 0)
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
		package.loaded["lualine.themes.otherhalf"] = nil
		lualine.setup({ options = { theme = "otherhalf" } })
	end
end

return M
