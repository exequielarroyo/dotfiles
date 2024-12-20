vim.opt.background = 'light'
-- function hex_to_rgb(hex)
-- 	return {
-- 		tonumber(hex:sub(2, 3), 16),
-- 		tonumber(hex:sub(4, 5), 16),
-- 		tonumber(hex:sub(6, 7), 16),
-- 	}
-- end
--
-- function blend(color1, color2, weight)
-- 	weight = weight or 0.5
--
-- 	local rgb1 = hex_to_rgb(color1)
-- 	local rgb2 = hex_to_rgb(color2)
-- 	local rgb_blended = {}
-- 	for i = 1, 3 do
-- 		rgb_blended[i] = math.floor(rgb1[i] * weight + rgb2[i] * (1 - weight))
-- 	end
--
-- 	return string.format("#%02x%02x%02x", rgb_blended[1], rgb_blended[2], rgb_blended[3])
-- end

local t = {
	-- bg = "#16181a",
	bg = none,
	bgAlt = "#1e2124",
	bgHighlight = "#3c4048",
	fg = "#ffffff",
	grey = "#7b8496",
	blue = "#5ea1ff",
	green = "#5eff6c",
	cyan = "#5ef1ff",
	red = "#ff6e5e",
	yellow = "#f1ff5e",
	magenta = "#ff5ef1",
	pink = "#ff5ea0",
	orange = "#ffbd5e",
	purple = "#bd5eff",
}

local highlights = {
	Comment = { fg = t.grey },
	ColorColumn = { bg = t.bgHighlight },
	Conceal = { fg = t.grey },
	Cursor = { fg = t.bg, bg = t.fg },
	ICursor = { fg = t.bg, bg = t.fg },
	CursorIM = { fg = t.bg, bg = t.fg },
	CursorColumn = { bg = t.bgHighlight },
	CursorLine = { bg = t.bgHighlight },
	Directory = { fg = t.blue },
	-- DiffAdd = { bg = blend(t.bg_solid, t.green, 0.8) },
	-- DiffChange = { bg = blend(t.bg_solid, t.blue, 0.8) },
	-- DiffDelete = { bg = blend(t.bg_solid, t.red, 0.8) },
	-- DiffText = { bg = blend(t.bg_solid, t.orange, 0.8) },
	Added = { fg = t.green },
	Removed = { fg = t.red },
	EndOfBuffer = { fg = t.bg },
	ErrorMsg = { fg = t.red },
	VertSplit = { fg = t.bgHighlight, bg = t.bg },
	WinSeparator = { fg = t.bgHighlight, bg = t.bg },
	Folded = { fg = t.grey, bg = t.bg },
	FoldColumn = { fg = t.grey, bg = t.bg },
	SignColumn = { fg = t.grey, bg = t.bg },
	SignColumnSB = { fg = t.grey, bg = t.bg },
	Substitute = { fg = t.red, bg = t.bgHighlight },
	-- LineNr = { fg = blend(t.bgHighlight, t.fg, 0.9) },
	CursorLineNr = { fg = t.grey },
	MatchParen = { fg = t.pink, bg = t.bgHighlight },
	ModeMsg = { fg = t.fg },
	MsgArea = { fg = t.fg },
	MoreMsg = { fg = t.blue },
	-- NonText = { fg = blend(t.bg_solid, t.grey, 0.55) },
	Normal = { fg = t.fg, bg = t.bg },
	NormalNC = { fg = t.fg, bg = t.bg },
	NormalFloat = { fg = t.fg, bg = t.bg },
	FloatTitle = { fg = t.cyan, bg = t.bg },
	FloatBorder = { fg = t.bgHighlight, bg = t.bg },
	Pmenu = { fg = t.fg, bg = t.bg },
	PmenuSel = { fg = t.fg, bg = t.bgHighlight },
	PmenuSbar = { fg = t.bg, bg = t.bgHighlight },
	PmenuThumb = { fg = t.bg, bg = t.bgHighlight },
	Question = { fg = t.yellow },
	QuickFixLine = { bg = t.bgHighlight },
	Search = { fg = t.bgAlt, bg = t.fg },
	IncSearch = { fg = t.bgAlt, bg = t.cyan },
	CurSearch = { fg = t.bgAlt, bg = t.cyan },
	SpecialKey = { fg = t.grey },
	SpellBad = { sp = t.red, undercurl = true },
	SpellCap = { sp = t.yellow, undercurl = true },
	SpellLocal = { sp = t.blue, undercurl = true },
	SpellRare = { sp = t.purple, undercurl = true },
	StatusLine = { fg = t.fg, bg = t.bg },
	StatusLineNC = { fg = t.grey, bg = t.bg },
	TabLine = { fg = t.grey, bg = t.bg },
	TabLineFill = { fg = t.grey, bg = t.bgHighlight },
	TabLineSel = { fg = t.fg, bg = t.bgHighlight },
	WinBar = { fg = t.fg, bg = t.bg },
	WinBarNC = { fg = t.grey, bg = t.bg },
	Title = { fg = t.fg },
	Visual = { bg = t.bgHighlight },
	VisualNOS = { bg = t.bgHighlight },
	WarningMsg = { fg = t.orange },
	Whitespace = { fg = t.grey },
	WildMenu = { fg = t.bg, bg = t.blue },

	Constant = { fg = t.pink },
	String = { fg = t.green },
	Character = { fg = t.green },
	Boolean = { fg = t.cyan },
	Number = { fg = t.orange },

	Identifier = { fg = t.fg },
	Function = { fg = t.blue },
	Statement = { fg = t.magenta },
	Operator = { fg = t.purple },
	Keyword = { fg = t.orange },
	PreProc = { fg = t.cyan },
	Label = { fg = t.orange },

	Type = { fg = t.purple },

	Special = { fg = t.pink },
	Delimiter = { fg = t.fg },

	Debug = { fg = t.orange },

	Underlined = { underline = true },
	Bold = { bold = true },
	Italic = { italic = true },

	Error = { fg = t.red },
	Todo = { fg = t.purple, bold = true },

	qfLineNr = { fg = t.grey },
	qfFileName = { fg = t.blue },

	htmlH1 = { fg = t.orange, bold = true },
	htmlH2 = { fg = t.orange, bold = true },

	mkdCodeDelimiter = { fg = t.grey },
	mkdCodeStart = { fg = t.blue },
	mkdCodeEnd = { fg = t.blue },

	markdownHeadingDelimiter = { fg = t.grey },
	markdownCode = { fg = t.cyan },
	markdownCodeBlock = { fg = t.cyan },
	markdownH1 = { fg = t.orange, bold = true },
	markdownH2 = { fg = t.cyan, bold = true },
	markdownH3 = { fg = t.blue, bold = true },
	markdownH4 = { fg = t.purple, bold = true },
	markdownH5 = { fg = t.magenta, bold = true },
	markdownH6 = { fg = t.green, bold = true },
	markdownLinkText = { fg = t.blue, underline = true },

	LspReferenceText = { bg = t.bgHighlight },
	LspReferenceRead = { bg = t.bgHighlight },
	LspReferenceWrite = { bg = t.bgHighlight },

	DiagnosticError = { fg = t.red },
	DiagnosticWarn = { fg = t.yellow },
	DiagnosticInfo = { fg = t.blue },
	DiagnosticHint = { fg = t.cyan },
	DiagnosticUnnecessary = { fg = t.grey },

	DiagnosiiucVirtualTextError = { fg = t.red },
	DiagnosticVirtualTextWarn = { fg = t.yellow },
	DiagnosticVirtualTextInfo = { fg = t.blue },
	DiagnosticVirtualTextHint = { fg = t.cyan },

	DiagnosticUnderlineError = { undercurl = true, sp = t.red },
	DiagnosticUnderlineWarn = { undercurl = true, sp = t.yellow },
	DiagnosticUnderlineInfo = { undercurl = true, sp = t.blue },
	DiagnosticUnderlineHint = { undercurl = true, sp = t.cyan },

	LspSignatureActiveParameter = { fg = t.orange },
	LspCodeLens = { fg = t.grey },
	LspInlayHint = { fg = t.grey },
	LspInfoBorder = { fg = t.bg },
}

for name, properties in pairs(highlights) do
	-- Make a copy of the properties table to avoid modifying the original
	local hl = vim.tbl_extend("force", {}, properties)

	-- Set the highlight group using vim.api.nvim_set_hl
	vim.api.nvim_set_hl(0, name, hl)
end
