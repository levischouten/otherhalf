local M = {}

function M.apply(hi, p, bg, opts)
	-- Snacks indent lines
	hi("SnacksIndent", { fg = p.selection, bg = p.bg })
	hi("SnacksIndentScope", { fg = p.indent_scope, bg = p.bg })
end

return M
