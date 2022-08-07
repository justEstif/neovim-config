-----------------------------------------------------------
-- Color schemes configuration file
-----------------------------------------------------------

local status_ok_one_dark, one_dark = pcall(require, "onedark")
if not status_ok_one_dark then
	return
end

-- OneDark styles: dark, darker, cool, deep, warm, warmer, light
one_dark.setup({
	style = "darker",
	colors = { fg = "#b2bbcc" }, --default: #a0a8b7  secondary: #b2bbcc
})

one_dark.load()
