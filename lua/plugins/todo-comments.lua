-----------------------------------------------------------
-- Todo Comments configuration file
----------------------------------------------------------

local telescope_status_ok, todo_comments = pcall(require, "todo-comments")
if not telescope_status_ok then
	return
end

todo_comments.setup({})
