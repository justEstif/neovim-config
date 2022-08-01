local actions_status_ok, actions = pcall(require, "telescope.actions")
if not actions_status_ok then
	return
end

local file_browser = {
	previewer = false,
	theme = "ivy",
	initial_mode = "normal",
	mappings = {
		["i"] = {},
		["n"] = {
			["<C-n>"] = actions.close, -- exit
		},
	},
}

return file_browser
