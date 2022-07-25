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
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = ","

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Disable arrow keys
map("", "<up>", "<nop>")
map("", "<down>", "<nop>")
map("", "<left>", "<nop>")
map("", "<right>", "<nop>")

map("i", "jk", "<Esc>") -- map esc to jk

map("n", "H", "_") -- H to go the start of line(n)
map("v", "H", "_") -- H to go the start of line(v)
map("n", "L", "$") -- L to go to the end of line(n)
map("v", "L", "$") -- L to go to the end of line(v)
map("n", "J", "}") -- J to jump previous blocks(n)
map("v", "J", "}") -- J to jump previous blocks(v)
map("n", "K", "{") -- L to jump next blocks(n)
map("v", "K", "{") -- L to jump next blocks(v)
map("n", '"', "%") -- " to jump to matching closer
map("v", '"', "%") -- " to jump to matching bracket

map("n", "<A-j>", ":m .+1<CR>==") -- move line up(n)
map("n", "<A-k>", ":m .-2<CR>==") -- move line down(n)
map("v", "<A-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
map("v", "<A-k>", ":m '<-2<CR>gv=gv") -- move line down(v)
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi") -- move line up(i)
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi") -- move line down(i)

-- don't replace the yanked with the replaced
map("v", "p", '"_dP')

-- Window
map("n", "<C-k>", "<C-w>k") -- window up
map("n", "<C-h>", "<C-w>h") -- window left
map("n", "<C-j>", "<C-w>j") -- window down
map("n", "<C-l>", "<C-w>l") -- window right

-- Buffers
map("n", "<leader>bn", ":bn<CR>") -- next buffer(n)
map("n", "<leader>bp", ":bp<CR>") -- previous buffer(n)
map("n", "<leader>bk", ":Bdelete<CR>") -- kill current buffer(n)
map("n", "<leader>bl", ":Telescope buffers<CR>") -- list all buffers

-- Tabs
map("n", "<leader>tt", ":tabedit<CR>") -- open buffer in new tab
map("n", "<leader>tn", ":tabnext<CR>") -- go to next tab
map("n", "<leader>tp", ":tabprev<CR>") -- go to prev tab
map("n", "<leader>tk", ":tabclose<CR>") -- kill current tab

-- Terminal
map("t", "<Esc>", "<C-\\><C-n>") -- esc exit terminal

-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

map("n", "<leader>j", "gJ") -- leader j to join lines(n)
map("v", "<leader>j", "gJ") -- leader j to join lines(v)

map("n", "<Esc>", ":nohl<CR>") -- clear search highlights
map("n", "<leader>s", ":w<CR>") -- save file
map("n", "<leader>r", ":so %<CR>") -- Reload configuration without restart nvim
map("n", "<leader>q", ":qa!<CR>") -- force exit

-- gx to open link under cursor
map("n", "gx", "<cmd>silent execute '!open ' . shellescape('<cWORD>')<CR>")

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- NvimTree
map("n", "<C-n>", ":NvimTreeToggle<CR>") -- open/close

-- Hop
map("n", "ml", "<cmd>HopLineStart<CR>")
map("v", "ml", "<cmd>HopLineStart<CR>")
map("n", "s", "<cmd>HopChar2<CR>")
map("v", "s", "<cmd>HopChar2<CR>")

-- Telescope
map("n", "ms", ":Telescope current_buffer_fuzzy_find<CR>") -- find text in current file
map("n", "mS", ":Telescope live_grep<CR>") -- find text in directory
map("n", "<C-p>", ":Telescope find_files<CR>") -- find file

-- other keybindings in:
-- plugins.lsp/handlers
-- plugins.nvim-cmp
-- plugins.telescope
-- plugins.tree
-- plugins.toggleterm
