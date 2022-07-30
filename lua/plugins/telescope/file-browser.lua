local actions_status_ok, actions = pcall(require, "telescope.actions")
if not actions_status_ok then
	return
end

local utils = require("core.utils")

local file_browser = {
	previewer = false,
	theme = "ivy",
	on_complete = { -- start in normal mode
		utils.start_normal,
	},
	mappings = {
		["i"] = {
			-- your custom insert mode mappings
			["<C-n>"] = actions.close, -- exit
		},
		["n"] = {
			-- your custom normal mode mappings
		},
	},
}

return file_browser
