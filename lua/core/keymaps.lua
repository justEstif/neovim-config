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
local disable_keys = { "<up>", "<left>", "<down>", "<right>", "gh", "gl", "gL", "<C-u>", "<C-b>", "<C-e>" }
for _, disable_key in pairs(disable_keys) do
	map("", disable_key, "<nop>")
end

-- Custom Navigation
map({ "n", "v" }, '"', "%") -- " to jump to matching closer
map({ "n", "v" }, "H", "_") -- H to go the start of line(n)
map({ "n", "v" }, "L", "$") -- L to go to the end of line(n)
map({ "n", "v" }, "K", "{") -- L to jump next blocks(n)
map({ "n", "v" }, "J", "}") -- J to jump previous blocks(n)
map({ "n", "v" }, "<C-f>", "<C-u><Esc>") -- move half up/turn off f
map({ "n", "v" }, "<C-u>", "<C-e>") -- scroll with C-u anc C-y

-- Lines
map("n", "<A-j>", ":m .+1<CR>==") -- move line up(n)
map("n", "<A-k>", ":m .-2<CR>==") -- move line down(n)
map("v", "<A-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
map("v", "<A-k>", ":m '<-2<CR>gv=gv") -- move line down(v)

-- Tabs
map("n", "<leader>tt", ":tabedit<CR>") -- open buffer in new tab
map("n", "<leader>tn", ":tabnext<CR>") -- go to next tab
map("n", "<leader>tp", ":tabprev<CR>") -- go to prev tab
map("n", "<leader>to", ":tabonly<CR>") -- kill all other tabs
map("n", "<leader>tk", ":tabclose<CR>") -- kill current tab

-- Buffers
map("n", "<leader>bn", ":bn<CR>") -- next buffer(n)
map("n", "<leader>bp", ":bp<CR>") -- previous buffer(n)
map("n", "<leader>bk", ":lua MiniBufremove.delete()<cr>") -- delete current buffer
map("n", "<leader>q", ":bufdo bdelete<CR>:Alpha<CR>") -- kill all buffers

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

-- Indent
map("n", ">", ">>") -- quick indent
map("n", "<", "<<") -- quick indent
map("v", "<", "<gv") -- stay in indent mode
map("v", ">", ">gv") -- stay in indent mode

-- Others
map("v", "p", '"_dP') -- keep the yanked when pasting in visual mode
map("t", "<Esc>", [[<C-\><C-n>]]) -- esc exit terminal
map("n", "<Esc>", ":nohl<CR>") -- clear search highlights
map("n", "<leader>r", ":so %<CR>") -- Reload configuration without restart nvim
-- open link under cursor
map("n", "gx", "<cmd>silent execute '!open ' . shellescape('<cWORD>')<CR>")

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Hop
map({ "n", "v" }, "ss", ":HopChar2<CR>") -- sneak s

-- Telescope
map("n", "mS", ":Telescope live_grep<CR>") -- find text in directory
map("n", "<C-b>", ":Telescope buffers<CR>") -- list all buffers
map("n", "<C-p>", ":Telescope find_files<CR>") -- find file
map("n", "<C-n>", ":Telescope file_browser<CR>") -- open/close file browser
map("n", "ms", ":Telescope current_buffer_fuzzy_find<CR>") -- find text in current file

-- other keybindings in:
-- plugins.lsp/handlers
-- plugins.nvim-cmp
-- plugins.telescope/file-explorer
-- plugins.toggleterm -> <C-t>
-- plugins.mini -> remapped f/F/t/T/
