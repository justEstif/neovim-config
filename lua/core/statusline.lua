----------------------------------------------------------
-- Statusline configuration file
-----------------------------------------------------------

local status_ok, feline = pcall(require, "feline")
if not status_ok then
	return
end

local gruvbox_colors = {
	fg = "#928374",
	bg = "#1F2223",
	black = "#1B1B1B",
	skyblue = "#458588",
	cyan = "#83a597",
	green = "#689d6a",
	oceanblue = "#1d2021",
	magenta = "#fb4934",
	orange = "#fabd2f",
	red = "#cc241d",
	violet = "#b16286",
	white = "#ebdbb2",
	yellow = "#d79921",
}

local vi_mode_colors = {
	NORMAL = gruvbox_colors.cyan,
	INSERT = gruvbox_colors.green,
	VISUAL = gruvbox_colors.yellow,
	OP = gruvbox_colors.cyan,
	BLOCK = gruvbox_colors.cyan,
	REPLACE = gruvbox_colors.red,
	["V-REPLACE"] = gruvbox_colors.red,
	ENTER = gruvbox_colors.orange,
	MORE = gruvbox_colors.orange,
	SELECT = gruvbox_colors.yellow,
	COMMAND = gruvbox_colors.pink,
	SHELL = gruvbox_colors.pink,
	TERM = gruvbox_colors.pink,
	NONE = gruvbox_colors.yellow,
}

local vi_mode_utils = require("feline.providers.vi_mode")

local separator = "|"

-- My components
local comps = {
	-- vi_mode -> NORMAL, INSERT..
	vi_mode = {
		left = {
			provider = function()
				local label = " " .. vi_mode_utils.get_vim_mode() .. " "
				return label
			end,
			hl = function()
				local set_color = {
					name = vi_mode_utils.get_mode_highlight_name(),
					fg = gruvbox_colors.bg,
					bg = vi_mode_utils.get_mode_color(),
					style = "bold",
				}
				return set_color
			end,
			left_sep = "",
			right_sep = " ",
		},
	},
	-- Parse file information:
	file = {
		-- File name
		info = {
			provider = {
				name = "file_info",
				opts = {
					type = "relative",
					file_modified_icon = "",
				},
			},
			hl = {
				fg = gruvbox_colors.cyan,
			},
			icon = "",
		},
		-- File type
		type = {
			provider = function()
				local type = vim.bo.filetype:lower()
				return " " .. type .. " "
			end,
			hl = {
				fg = gruvbox_colors.fg,
			},
			left_sep = {
				str = " " .. separator,
				hl = {
					fg = gruvbox_colors.fg,
				},
			},
			righ_sep = " ",
		},
	},
	-- LSP info
	diagnos = {
		err = {
			provider = "diagnostic_errors",
			icon = " ",
			hl = {
				fg = gruvbox_colors.red,
			},
			left_sep = "  ",
		},
		warn = {
			provider = "diagnostic_warnings",
			icon = " ",
			hl = {
				fg = gruvbox_colors.yellow,
			},
			left_sep = " ",
		},
		info = {
			provider = "diagnostic_info",
			icon = " ",
			hl = {
				fg = gruvbox_colors.green,
			},
			left_sep = " ",
		},
		hint = {
			provider = "diagnostic_hints",
			icon = " ",
			hl = {
				fg = gruvbox_colors.cyan,
			},
			left_sep = " ",
		},
	},
	lsp = {
		name = {
			provider = "lsp_client_names",
			icon = " ",
			hl = {
				fg = gruvbox_colors.pink,
			},
			left_sep = "",
			right_sep = "",
		},
	},
	-- git info
	git = {
		branch = {
			provider = "git_branch",
			icon = " ",
			hl = { fg = gruvbox_colors.pink },
			left_sep = "  ",
		},
		add = {
			provider = "git_diff_added",
			icon = " ",
			hl = { fg = gruvbox_colors.green },
			left_sep = " ",
		},
		change = {
			provider = "git_diff_changed",
			icon = " ",
			hl = { fg = gruvbox_colors.orange },
			left_sep = " ",
		},
		remove = {
			provider = "git_diff_removed",
			icon = " ",
			hl = { fg = gruvbox_colors.red },
			left_sep = " ",
		},
	},
}

local components = {
	active = {},
	inactive = {},
}

table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.inactive, {})
table.insert(components.inactive, {})

-- Right section
table.insert(components.active[1], comps.vi_mode.left)
table.insert(components.active[1], comps.file.info)
table.insert(components.inactive[1], comps.file.info)
table.insert(components.active[1], comps.git.branch)
table.insert(components.active[1], comps.git.add)
table.insert(components.active[1], comps.git.change)
table.insert(components.active[1], comps.git.remove)

-- Left Section
table.insert(components.active[2], comps.diagnos.err)
table.insert(components.active[2], comps.diagnos.warn)
table.insert(components.active[2], comps.diagnos.hint)
table.insert(components.active[2], comps.diagnos.info)
table.insert(components.active[2], comps.lsp.name)
table.insert(components.active[2], comps.file.type)

-- Call feline
feline.setup({
	theme = {
		bg = gruvbox_colors.bg,
		fg = gruvbox_colors.fg,
	},
	components = components,
	vi_mode_colors = vi_mode_colors,
	force_inactive = {
		filetypes = { "^NvimTree$", "^packer$", "^vista$", "^help$" },
		buftypes = { "^terminal$" },
		bufnames = {},
	},
})
