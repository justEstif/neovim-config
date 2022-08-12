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
    ['<'] = { action = 'open', pair = '<>', neigh_pattern = '[^\\].' },
    ['>'] = { action = 'close', pair = '<>', neigh_pattern = '[^\\].' },
  },
})
