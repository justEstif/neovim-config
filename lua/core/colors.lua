-----------------------------------------------------------
-- Color schemes configuration file
-----------------------------------------------------------

-- See: https://github.com/brainfucksec/neovim-lua#appearance

-- Load nvim color scheme:
-- Change the "require" values with your color scheme
-- Available color schemes: onedark, monokai, rose-pine
local status_ok_one_dark, one_dark = pcall(require, "onedark")
if not status_ok_one_dark then
	return
end

-- OneDark styles: dark, darker, cool, deep, warm, warmer, light
one_dark.setup({
	style = "cool",
	colors = { fg = "#b2bbcc" }, --default: #a0a8b7  secondary: #b2bbcc
})
one_dark.load()

-- statusline color schemes:
-- import with: require('colors').colorscheme_name
local M = {}

-- Theme: OneDark (dark)
-- Colors: https://github.com/navarasu/onedark.nvim/blob/master/lua/onedark/palette.lua
M.onedark_dark = {
	bg = "#282c34",
	fg = "#b2bbcc",
	pink = "#c678dd",
	green = "#98c379",
	cyan = "#56b6c2",
	yellow = "#e5c07b",
	orange = "#d19a66",
	red = "#e86671",
}

return M
