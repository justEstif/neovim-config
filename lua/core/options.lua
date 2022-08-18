-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

local g = vim.g -- Global variables
local opt = vim.opt -- Set options (global/buffer/windows-scoped)

local options = {
	-- General
	mouse = "a", -- Enable mouse support
	clipboard = "unnamedplus", -- Copy/paste to system clipboard
	swapfile = false, -- Don't use swapfile
	completeopt = "menuone,noinsert,noselect", -- Autocomplete options

	-- Search
	ignorecase = true, -- Ignore case letters when search
	smartcase = true, -- Ignore lowercase for the whole pattern
	gdefault = true, -- default g flag to search
	showmatch = true, -- Highlight matching parenthesis

	-- Line Number
	number = true, -- true of number
	relativenumber = true, -- relative numebr
	numberwidth = 1, -- width of number
	signcolumn = "yes:1", -- sign column default size

	-- Fold
	foldenable = false, -- don't start folded
	foldtext = string.format("  %s: %d lines", vim.fn.getline(vim.v.foldstart), vim.v.foldend - vim.v.foldstart + 1),
	fillchars = { eob = "-", fold = " " },

	-- UI
	linebreak = true, -- Wrap on word boundary
	splitright = true, -- Vertical split to the right
	splitbelow = true, -- Horizontal split to the bottom
	termguicolors = true, -- Enable 24-bit RGB colors
	laststatus = 3, -- Set global statusline
	cursorline = true, -- Cursorline on
	pumheight = 15, -- pop up menu height

	-- Tabs, indent
	expandtab = true, -- Use spaces instead of tabs
	shiftwidth = 2, -- Shift 2 spaces when tab
	tabstop = 2, -- 1 tab == 2 spaces
	smartindent = true, -- Autoindent new lines

	-- Memory, CPU
	hidden = true, -- Enable background buffers
	history = 100, -- Remember N lines in history
	synmaxcol = 240, -- Max column for syntax highlight
	lazyredraw = true, -- Faster scrolling
	updatetime = 300, -- ms to wait for trigger an event
	undofile = true, -- enable persistent undo
}

-- Settings Options
for k, v in pairs(options) do
	opt[k] = v
end

-- Disable builtins plugins
local disabled_built_ins = {
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"rrhelper",
	"spellfile_plugin",
	"matchit",
}

for _, plugin in pairs(disabled_built_ins) do
	g["loaded_" .. plugin] = 1
end

-- Other options
opt.shortmess:append("sI") -- Disable nvim intro
