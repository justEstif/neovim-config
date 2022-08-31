-----------------------------------------------------------
-- True zen configuration file
----------------------------------------------------------

local status, true_zen = pcall(require, "true-zen")
if not status then
	return
end

true_zen.setup({})
