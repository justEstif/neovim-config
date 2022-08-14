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

local status_pair, mini_pairs = pcall(require, "mini.pairs")
if not status_pair then
	return
end

mini_pairs.setup({
	mappings = {
		["<"] = { action = "open", pair = "<>", neigh_pattern = "[^\\]." },
		[">"] = { action = "close", pair = "<>", neigh_pattern = "[^\\]." },
	},
})

local status_tabline, mini_tabline = pcall(require, "mini.tabline")
if not status_tabline then
	return
end

mini_tabline.setup({
	show_icons = false,
	tabpage_section = "right",
})

local status_indentscope, mini_indentscope = pcall(require, "mini.indentscope")
if not status_indentscope then
	return
end

mini_indentscope.setup({
	draw = { delay = 0 },
})
