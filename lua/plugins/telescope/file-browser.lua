local actions_status_ok, actions = pcall(require, "telescope.actions")
if not actions_status_ok then
	return
end

local file_browser = {
	theme = "ivy",
	initial_mode = "normal",
	path = "%:p:h", -- open the file_browser from within the folder of your current buffer
	grouped = true,
	sorting_strategy = "ascending",
	mappings = {
		["i"] = {
			["<C-n>"] = actions.close, -- exit
		},
		["n"] = {
			["<C-n>"] = actions.close, -- exit
		},
	},
}

return file_browser
