-----------------------------------------------------------
-- Telescope configuration file
----------------------------------------------------------
local telescope_status_ok, telescope = pcall(require, "telescope")
if not telescope_status_ok then
	return
end

local actions_status_ok, actions = pcall(require, "telescope.actions")
if not actions_status_ok then
	return
end

local layout_ok, actions_layout = pcall(require, "telescope.actions.layout")
if not layout_ok then
	return
end

telescope.setup({

	defaults = {
		entry_prefix = "  ", -- remove symbols
		prompt_prefix = "  ",
		selection_caret = "  ",

		mappings = {
			i = {
				["<C-u>"] = false, -- clear input with C-u
				["<C-p>"] = actions.close, -- exit
				["<C-j>"] = actions.move_selection_next, -- next item
				["<C-k>"] = actions.move_selection_previous, -- previous item
				["<C-?>"] = actions.which_key, -- available keys
				["<C-w>"] = actions_layout.toggle_preview, -- toggle preview
			},
			n = {
				["<C-?>"] = actions.which_key, -- see options
				["<C-w>"] = actions_layout.toggle_preview, -- toggle preview
			},
		},

		file_ignore_patterns = { -- ignore these files
			"node_modules/.*",
			".git/.*",
		},
		layout_strategy = "flex", -- display: flex;
	},
	pickers = { -- defining the options of different pickers
		find_files = {
			theme = "dropdown",
			previewer = false,
			find_command = { "fd", "--type", "f", "--strip-cwd-prefix", "-u" }, -- turn off "./", show all
		},
		current_buffer_fuzzy_find = {
			theme = "ivy",
			previewer = false,
		},
		live_grep = {
			theme = "ivy",
		},
		lsp_references = {
			theme = "dropdown",
			initial_mode = "normal",
		},
		diagnostics = {
			theme = "ivy",
			initial_mode = "normal",
		},
		buffers = {
			theme = "ivy",
			initial_mode = "normal",
			mappings = { -- easy close buffer shortcut
				i = {
					["<C-d>"] = actions.delete_buffer,
				},
				n = {
					["D"] = actions.delete_buffer,
					["<C-d>"] = actions.delete_buffer,
				},
			},
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_genearic_sorter = false,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
})

telescope.load_extension("fzf")
