-----------------------------------------------------------
-- Todo Comments configuration file
----------------------------------------------------------

local status_ok, todo_comments = pcall(require, "todo-comments")
if not status_ok then
	return
end

todo_comments.setup({
	highlight = {
		keyword = "bg", -- "fg", "bg", "wide" or empty.
	},
	keywords = {
		IDEA = { icon = "", color = "hint" },
		QUESTION = { icon = "", color = "hint" },
	},
})
