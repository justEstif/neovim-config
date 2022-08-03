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

	-- UI
	signcolumn = "yes:1", -- spacing to the right
	showmatch = true, -- Highlight matching parenthesis
	colorcolumn = "", -- Line length marker at 80 columns
	splitright = true, -- Vertical split to the right
	splitbelow = true, -- Horizontal split to the bottom
	ignorecase = true, -- Ignore case letters when search
	smartcase = true, -- Ignore lowercase for the whole pattern
	linebreak = true, -- Wrap on word boundary
	termguicolors = true, -- Enable 24-bit RGB colors
	laststatus = 3, -- Set global statusline
	scrolloff = 5, -- Number of lines above and below cursor
	cursorline = true, -- Cursorline on
	showtabline = 0, -- don't show tabline
	pumheight = 15, -- pop up menu height
	foldenable = false, -- don't start folded
	foldtext = string.format("  %s: %d lines", vim.fn.getline(vim.v.foldstart), vim.v.foldend - vim.v.foldstart + 1),
	fillchars = { eob = "-", fold = " " },

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
opt.iskeyword:append("-") -- set words with - as 1
opt.iskeyword:append("_") -- set words with _ as 1
opt.shortmess:append("sI") -- Disable nvim intro
