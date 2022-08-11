-----------------------------------------------------------
-- Mini configuration file
----------------------------------------------------------

local status_jump, mini_jump = pcall(require, "mini.jump")
if not status_jump then
	return
end

mini_jump.setup({
	delay = {
		highlight = 150,
		idle_stop = 1000,
	},
})
