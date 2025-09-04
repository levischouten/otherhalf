local M = {}

function M.apply(hi, p, bg, opts)
	-- Snacks indent lines
	hi("SnacksIndent", { fg = p.selection })
	hi("SnacksIndentScope", { fg = p.indent_scope })
end

return M
