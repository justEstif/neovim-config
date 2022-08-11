-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
	local options = {
		noremap = true,
		silent = true,
	}
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

vim.g.mapleader = ","

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- disable keys
local disable_keys = { "<up>", "<left>", "<down>", "<right>", "gh", "gl", "gL" }
for _, disable_key in pairs(disable_keys) do
	map("", disable_key, "<nop>")
end

map({ "n", "v" }, "H", "_") -- H to go the start of line(n)
map({ "n", "v" }, "L", "$") -- L to go to the end of line(n)
map({ "n", "v" }, "J", "}") -- J to jump previous blocks(n)
map({ "n", "v" }, "K", "{") -- L to jump next blocks(n)
map({ "n", "v" }, '"', "%") -- " to jump to matching closer

map("n", "<A-j>", ":m .+1<CR>==") -- move line up(n)
map("n", "<A-k>", ":m .-2<CR>==") -- move line down(n)
map("v", "<A-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
map("v", "<A-k>", ":m '<-2<CR>gv=gv") -- move line down(v)

-- Window
map("n", "<C-k>", "<C-w>k") -- window up
map("n", "<C-h>", "<C-w>h") -- window left
map("n", "<C-j>", "<C-w>j") -- window down
map("n", "<C-l>", "<C-w>l") -- window right

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>")
map("n", "<C-Down>", ":resize +2<CR>")
map("n", "<C-Left>", ":vertical resize +2<CR>")
map("n", "<C-Right>", ":vertical resize -2<CR>")

map("v", "p", '"_dP') -- keep the yanked when pasting in visual mode

map("t", "<Esc>", "<C-\\><C-n>") -- esc exit terminal

map("n", ">", ">>") -- quick indent
map("n", "<", "<<") -- quick indent
map("v", "<", "<gv") -- stay in indent mode
map("v", ">", ">gv") -- stay in indent mode

map({ "n", "v" }, "<leader>j", "gJ") -- leader j to join lines(n)

map("n", "<Esc>", ":nohl<CR>") -- clear search highlights
map("n", "<leader>q", ":bufdo bdelete<CR>:Alpha<CR>") -- kill all buffers
map("n", "<leader>r", ":so %<CR>") -- Reload configuration without restart nvim

-- open link under cursor
map("n", "gx", "<cmd>silent execute '!open ' . shellescape('<cWORD>')<CR>")

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Sneak = Hop + Telescope
map({ "n", "v" }, "s", "<cmd>HopChar2<CR>") -- sneak full
map({ "n", "v" }, "f", "<cmd>HopChar1CurrentLine<CR>") -- sneak full
map(
	{ "n", "v" },
	"t",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection, current_line_only = true, hint_offset = -1 })<cr>"
)
map({ "n", "v" }, "ml", "<cmd>HopLine<CR>") -- sneak line

-- Telescope
map("n", "ms", ":Telescope current_buffer_fuzzy_find<CR>") -- find text in current file
map("n", "mS", ":Telescope live_grep<CR>") -- find text in directory
map("n", "<C-p>", ":Telescope find_files<CR>") -- find file
map("n", "<space>b", ":Telescope buffers<CR>") -- list all buffers

-- Nvim Tree
map("n", "<C-n>", ":NvimTreeToggle<CR>") -- open/close
-- other keybindings in:
-- plugins.lsp/handlers
-- plugins.nvim-cmp
-- plugins.telescope
-- plugins.tree
-- plugins.toggleterm
