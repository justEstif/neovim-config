-----------------------------------------------------------
-- Color schemes configuration file
-----------------------------------------------------------

local one_nord_ok, one_nord = pcall(require, "onenord")
if not one_nord_ok then
	return
end

one_nord.setup({
	theme = "dark", -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
	borders = true, -- Split window borders
	fade_nc = false,
})
