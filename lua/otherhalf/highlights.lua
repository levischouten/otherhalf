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

	-- Neo-tree
	hi("NeoTreeDirectoryName", { fg = p.blue, bg = p.bg })
	hi("NeoTreeDirectoryIcon", { fg = p.blue, bg = p.bg })
	hi("NeoTreeFileName", { fg = p.fg, bg = p.bg })
	hi("NeoTreeFileNameOpened", { fg = p.cyan, bg = p.bg })
	hi("NeoTreeNormal", { fg = p.fg, bg = p.bg })
	hi("NeoTreeNormalNC", { fg = p.fg, bg = p.bg })
	hi("NeoTreeExpander", { fg = p.gutter, bg = p.bg })
	hi("NeoTreeIndentMarker", { fg = p.gutter, bg = p.bg })
	hi("NeoTreeRootName", { fg = p.blue, bold = true, bg = p.bg })
	hi("NeoTreeSymbolicLinkTarget", { fg = p.magenta, bg = p.bg })
	hi("NeoTreeModified", { fg = p.yellow, bg = p.bg })
	hi("NeoTreeDimText", { fg = p.br_black, bg = p.bg })

	-- Neo-tree Git
	hi("NeoTreeGitAdded", { fg = p.green, bg = p.bg })
	hi("NeoTreeGitConflict", { fg = p.red, bg = p.bg })
	hi("NeoTreeGitDeleted", { fg = p.red, bg = p.bg })
	hi("NeoTreeGitIgnored", { fg = p.gutter, bg = p.bg })
	hi("NeoTreeGitModified", { fg = p.yellow, bg = p.bg })
	hi("NeoTreeGitUnstaged", { fg = p.red, bg = p.bg })
	hi("NeoTreeGitUntracked", { fg = p.magenta, bg = p.bg })
	hi("NeoTreeGitStaged", { fg = p.green, bg = p.bg })

	-- Neo-tree UI
	hi("NeoTreeFloatBorder", { link = "FloatBorder" })
	hi("NeoTreeTitleBar", { fg = p.bg, bg = p.blue })
	hi("NeoTreeFilterTerm", { fg = p.green, bold = true })
	hi("NeoTreeTabActive", { fg = p.blue, bg = p.selection, bold = true })
	hi("NeoTreeTabInactive", { fg = p.gutter, bg = p.selection })
	hi("NeoTreeTabSeparatorActive", { fg = p.blue, bg = p.bg })
	hi("NeoTreeTabSeparatorInactive", { fg = p.selection, bg = p.selection })
	hi("NeoTreeWinSeparator", { link = "WinSeparator" })
	hi("NeoTreeCursorLine", { fg = p.fg, bg = p.selection })

	-- FZF Lua
	-- hi("FzfLuaNormal", { fg = p.fg, bg = opts.transparent and "NONE" or p.bg })
	-- hi("FzfLuaBorder", { fg = p.gutter, bg = opts.transparent and "NONE" or p.bg })
	-- hi("FzfLuaPreviewNormal", { fg = p.fg, bg = opts.transparent and "NONE" or p.bg })
	-- hi("FzfLuaPreviewBorder", { fg = p.gutter, bg = opts.transparent and "NONE" or p.bg })
	-- hi("FzfLuaTitle", { fg = p.blue, bg = opts.transparent and "NONE" or p.bg, bold = true })
	-- hi("FzfLuaPreviewTitle", { fg = p.blue, bg = opts.transparent and "NONE" or p.bg, bold = true })
	-- hi("FzfLuaCursor", { link = "Cursor" })
	-- hi("FzfLuaCursorLine", { link = "CursorLine" })
	-- hi("FzfLuaSearch", { link = "Search" })
	--
	hi("FzfLuaNormal", { link = "NormalFloat" })
	hi("FzfLuaBorder", { link = "FloatBorder" })
	hi("FzfLuaTitle", { link = "FloatTitle" })
	hi("FzfLuaHeaderBind", { fg = p.yellow })
	hi("FzfLuaHeaderText", { fg = p.magenta })
	hi("FzfLuaDirPart", { link = "NonText" })
	hi("FzfLuaFzfMatch", { fg = p.blue })
	hi("FzfLuaFzfPrompt", { fg = p.blue })
	hi("FzfLuaPathColNr", { fg = p.blue })
	hi("FzfLuaPathLineNr", { fg = p.green })
	hi("FzfLuaBufName", { fg = p.br_magenta })
	hi("FzfLuaBufNr", { fg = p.yellow })
	hi("FzfLuaBufFlagCur", { fg = p.magenta })
	hi("FzfLuaBufFlagAlt", { fg = p.blue })
	hi("FzfLuaTabTitle", { fg = p.sky })
	hi("FzfLuaTabMarker", { fg = p.cyan })
	hi("FzfLuaLiveSym", { fg = p.magenta })
end

return M
