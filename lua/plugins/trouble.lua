-----------------------------------------------------------
-- Trouble configuration file
----------------------------------------------------------

local status, trouble = pcall(require, "trouble")
if not status then
	return
end

trouble.setup({
	icons = false,
	fold_open = "v",
	fold_closed = ">",
	indent_lines = false,
	signs = {
		error = "error",
		warning = "warn",
		hint = "hint",
		information = "info",
	},
	use_diagnostic_signs = false,

	action_keys = {
		close = "<esc>",
		cancel = "q",
	},
})
