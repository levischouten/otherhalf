local M = {}

function M.apply(hi, p, bg, opts)
	hi("RenderMarkdownCode", { bg = p.selection })
	hi("RenderMarkdownCodeInline", { bg = p.selection })
	hi("RenderMarkdownCodeInfo", { bg = p.selection })
	hi("RenderMarkdownCodeFallback", { bg = p.selection })
end

return M
