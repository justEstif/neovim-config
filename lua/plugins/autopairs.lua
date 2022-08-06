-----------------------------------------------------------
-- Autopairs configuration file
----------------------------------------------------------

local status_ok, autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
	return
end

autopairs.setup({
	enable_moveright = true,
	enable_afterquota = true,
	enable_check_bracket_line = true,
	ignored_next_char = "[%w%.]",
	check_ts = true,
	ts_config = {
		lua = { "string", "source" },
		javascript = { "string", "template_string" },
		java = false,
	},
	-- turn of auto pair in telescope
	disable_filetype = { "TelescopePrompt", "spectre_panel" },
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
