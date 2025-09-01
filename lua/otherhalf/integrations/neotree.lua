local M = {}

function M.apply(hi, p, bg, opts)
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
end

return M
