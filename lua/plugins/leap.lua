----------------------------------------------------------
-- Hop configuration file
----------------------------------------------------------

local status_ok, leap = pcall(require, "leap")
if not status_ok then
	return
end

leap.set_default_keymaps()

leap.setup({
	special_keys = {
		repeat_search = "<enter>",
		next_match = ";",
		prev_match = ",",
		next_group = "<space>",
		prev_group = "<tab>",
	},
})
