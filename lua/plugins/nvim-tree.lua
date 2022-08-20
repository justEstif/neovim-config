-----------------------------------------------------------
-- File manager configuration file
-----------------------------------------------------------

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

nvim_tree.setup({
	filters = {
		dotfiles = true,
		custom = { "^.git$", "node_modules", ".cache" },
		exclude = {},
	},
	view = {
		width = 35,
		preserve_window_proportions = true,
	},
})

-- key maps: reference
-- { key = "<C-v>",  cb = tree_cb("vsplit") },
-- { key = "<C-x>",  cb = tree_cb("split") },
-- { key = "R",      cb = tree_cb("refresh") },
-- { key = "P",      cb = tree_cb("parent_node") },
-- { key = "a",      cb = tree_cb("create") },
-- { key = "d",      cb = tree_cb("remove") },
-- { key = "r",      cb = tree_cb("rename") },

-- { key = "<C-t>",  cb = tree_cb("tabnew") },
-- { key = "<",      cb = tree_cb("prev_sibling") },
-- { key = ">",      cb = tree_cb("next_sibling") },
-- { key = "<BS>",   cb = tree_cb("close_node") },
-- { key = "<S-CR>", cb = tree_cb("close_node") },
-- { key = "<Tab>",  cb = tree_cb("preview") },
-- { key = "K",      cb = tree_cb("first_sibling") },
-- { key = "J",      cb = tree_cb("last_sibling") },
-- { key = "I",      cb = tree_cb("toggle_ignored") },
-- { key = "H",      cb = tree_cb("toggle_dotfiles") },
-- { key = "<C-r>",  cb = tree_cb("full_rename") },
-- { key = "x",      cb = tree_cb("cut") },
-- { key = "c",      cb = tree_cb("copy") },
-- { key = "p",      cb = tree_cb("paste") },
-- { key = "y",      cb = tree_cb("copy_name") },
-- { key = "Y",      cb = tree_cb("copy_path") },
-- { key = "gy",     cb = tree_cb("copy_absolute_path") },
-- { key = "[c",     cb = tree_cb("prev_git_item") },
-- { key = "]c",     cb = tree_cb("next_git_item") },
-- { key = "-",      cb = tree_cb("dir_up") },
-- { key = "q",      cb = tree_cb("close") },
-- { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
-- { key = {"<2-RightMouse>", "<C-]>"},    cb = tree_cb("cd") },
