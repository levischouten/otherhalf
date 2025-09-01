local function hi(group, spec)
	vim.api.nvim_set_hl(0, group, spec)
end

local function term_colors(p)
	local t = {
		p.black,
		p.red,
		p.green,
		p.yellow,
		p.blue,
		p.magenta,
		p.cyan,
		p.white,
		p.br_black,
		p.br_red,
		p.br_green,
		p.br_yellow,
		p.br_blue,
		p.br_magenta,
		p.br_cyan,
		p.br_white,
	}
	for i = 0, 15 do
		vim.g["terminal_color_" .. i] = t[i + 1]
	end
end

local M = {}

function M.apply(p, opts)
	local bg = opts.transparent and "NONE" or p.bg
	term_colors(p)

	vim.cmd("highlight clear")
	if vim.fn.exists("syntax_on") == 1 then
		vim.cmd("syntax reset")
	end

	-- Core
	hi("Normal", { fg = p.fg, bg = bg })
	hi("NormalFloat", { fg = p.fg, bg = opts.transparent and "NONE" or p.bg })
	hi("FloatBorder", { fg = p.gutter, bg = opts.transparent and "NONE" or p.bg })
	hi("LineNr", { fg = p.gutter, bg = bg })
	hi("CursorLine", { bg = p.selection })
	hi("CursorLineNr", { fg = p.yellow, bold = true, bg = p.selection })
	hi("Visual", { bg = p.selection })
	hi("Search", { fg = p.bg, bg = p.yellow, bold = true })
	hi("IncSearch", { fg = p.bg, bg = p.orange or p.yellow, bold = true })
	hi("Pmenu", { fg = p.fg, bg = opts.transparent and "NONE" or p.selection })
	hi("PmenuSel", { fg = p.bg, bg = p.blue })
	hi("MatchParen", { fg = p.blue, bold = true, underline = true })
	hi("WinSeparator", { fg = p.selection })

	-- Syntax
	hi("Comment", { fg = p.br_black, italic = opts.italics })
	hi("Constant", { fg = p.cyan })
	hi("String", { fg = p.green })
	hi("Character", { fg = p.green })
	hi("Number", { fg = p.cyan })
	hi("Boolean", { fg = p.cyan })
	hi("Identifier", { fg = p.fg })
	hi("Function", { fg = p.blue })
	hi("Statement", { fg = p.magenta })
	hi("Conditional", { fg = p.magenta })
	hi("Repeat", { fg = p.magenta })
	hi("Operator", { fg = p.fg })
	hi("Keyword", { fg = p.magenta })
	hi("Type", { fg = p.yellow })
	hi("PreProc", { fg = p.yellow })
	hi("Delimiter", { fg = p.fg })

	-- Diagnostics
	hi("DiagnosticError", { fg = p.red })
	hi("DiagnosticWarn", { fg = p.yellow })
	hi("DiagnosticInfo", { fg = p.blue })
	hi("DiagnosticHint", { fg = p.cyan })
	hi("DiagnosticUnderlineError", { sp = p.red, undercurl = true })
	hi("DiagnosticUnderlineWarn", { sp = p.yellow, undercurl = true })
	hi("DiagnosticUnderlineInfo", { sp = p.blue, undercurl = true })
	hi("DiagnosticUnderlineHint", { sp = p.cyan, undercurl = true })

	-- Treesitter (common)
	hi("@comment", { link = "Comment" })
	hi("@string", { link = "String" })
	hi("@number", { link = "Number" })
	hi("@boolean", { link = "Boolean" })
	hi("@function", { link = "Function" })
	hi("@keyword", { link = "Keyword" })
	hi("@type", { link = "Type" })
	hi("@variable", { fg = p.fg })

	-- Integrations
	if opts.integrations then
		for name, config in pairs(opts.integrations) do
			if config.enabled then
				local ok, integration = pcall(require, "otherhalf.integrations." .. name)
				if ok and integration.apply then
					integration.apply(hi, p, bg, opts)
				end
			end
		end
	end
end

return M
