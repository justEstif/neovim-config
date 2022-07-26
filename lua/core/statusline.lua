----------------------------------------------------------
-- Statusline configuration file
-----------------------------------------------------------

local status_ok, feline = pcall(require, "feline")
if not status_ok then
	return
end

local colors = {
	fg = "#C8D0E0",
	fg_light = "#E5E9F0",
	bg = "#2E3440",
	gray = "#646A76",
	light_gray = "#6C7A96",
	cyan = "#88C0D0",
	blue = "#81A1C1",
	dark_blue = "#5E81AC",
	green = "#A3BE8C",
	light_green = "#8FBCBB",
	dark_red = "#BF616A",
	red = "#D57780",
	light_red = "#DE878F",
	pink = "#E85B7A",
	dark_pink = "#E44675",
	orange = "#D08F70",
	yellow = "#EBCB8B",
	purple = "#B988B0",
	light_purple = "#B48EAD",
	none = "NONE",
}

local vi_mode_colors = {
	NORMAL = colors.cyan,
	INSERT = colors.green,
	VISUAL = colors.yellow,
	OP = colors.cyan,
	BLOCK = colors.orange,
	REPLACE = colors.red,
	["V-REPLACE"] = colors.red,
	ENTER = colors.orange,
	MORE = colors.orange,
	SELECT = colors.yellow,
	COMMAND = colors.pink,
	SHELL = colors.pink,
	TERM = colors.pink,
	NONE = colors.yellow,
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
					fg = colors.bg,
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
				fg = colors.cyan,
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
				fg = colors.fg,
			},
			left_sep = {
				str = " " .. separator,
				hl = {
					fg = colors.fg,
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
				fg = colors.red,
			},
			left_sep = "  ",
		},
		warn = {
			provider = "diagnostic_warnings",
			icon = " ",
			hl = {
				fg = colors.yellow,
			},
			left_sep = " ",
		},
		info = {
			provider = "diagnostic_info",
			icon = " ",
			hl = {
				fg = colors.green,
			},
			left_sep = " ",
		},
		hint = {
			provider = "diagnostic_hints",
			icon = " ",
			hl = {
				fg = colors.cyan,
			},
			left_sep = " ",
		},
	},
	lsp = {
		name = {
			provider = "lsp_client_names",
			icon = " ",
			hl = {
				fg = colors.pink,
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
			hl = { fg = colors.fg },
			left_sep = "  ",
		},
		add = {
			provider = "git_diff_added",
			icon = " ",
			hl = { fg = colors.green },
			left_sep = " ",
		},
		change = {
			provider = "git_diff_changed",
			icon = " ",
			hl = { fg = colors.orange },
			left_sep = " ",
		},
		remove = {
			provider = "git_diff_removed",
			icon = " ",
			hl = { fg = colors.red },
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
		bg = colors.bg,
		fg = colors.fg,
	},
	components = components,
	vi_mode_colors = vi_mode_colors,
	force_inactive = {
		filetypes = { "^NvimTree$", "^packer$", "^vista$", "^help$" },
		bufnames = {},
	},
})
