-----------------------------------------------------------
-- Color schemes configuration file
-----------------------------------------------------------

local one_nord_ok, one_nord = pcall(require, "onenord")
if not one_nord_ok then
	return
end

one_nord.setup({
	theme = "dark", -- dark || light
	borders = true, -- Split window borders
	fade_nc = false,
})

-- vim.cmd([[colorscheme slate]])
