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

-- disable arrow keys
local arrow_keys = { "<up>", "<left>", "<down>", "<right>" }
for _, arrow_key in pairs(arrow_keys) do
	map("", arrow_key, "<nop>")
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

map("n", "<space>qb", ":bufdo bdelete<CR>:Alpha<CR>") -- kill all buffers

map("v", "p", '"_dP') -- keep the yanked when pasting in visual mode

map("t", "<Esc>", "<C-\\><C-n>") -- esc exit terminal

map("n", ">", ">>") -- quick indent
map("n", "<", "<<") -- quick indent
map("v", "<", "<gv") -- stay in indent mode
map("v", ">", ">gv") -- stay in indent mode

map({ "n", "v" }, "<leader>j", "gJ") -- leader j to join lines(n)

map("n", "<Esc>", ":nohl<CR>") -- clear search highlights
map("n", "<leader>q", ":qa!<CR>") -- force exit
map("n", "<leader>r", ":so %<CR>") -- Reload configuration without restart nvim

-- open link under cursor
map("n", "gx", "<cmd>silent execute '!open ' . shellescape('<cWORD>')<CR>")

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Sneak = Hop + Telescope
map({ "n", "v" }, "s", "<cmd>HopChar2<CR>") -- sneak full
map({ "n", "v" }, "mw", "<cmd>HopWordCurrentLine<CR>") -- word by line
map({ "n", "v" }, "ml", "<cmd>HopLineStart<CR>") -- sneak line
map("n", "ms", ":Telescope current_buffer_fuzzy_find<CR>") -- find text in current file
map("n", "mS", ":Telescope live_grep<CR>") -- find text in directory

-- Telescope
map("n", "<C-p>", ":Telescope find_files<CR>") -- find file
map("n", "<C-n>", ":Telescope file_browser<CR>") -- Telescope file browser

-- Trouble
map("n", "<space>xx", "<cmd>Trouble<cr>")
map("n", "<space>xw", "<cmd>Trouble workspace_diagnostics<cr>")
map("n", "<space>xd", "<cmd>Trouble document_diagnostics<cr>")

-- other keybindings in:
-- plugins.lsp/handlers
-- plugins.nvim-cmp
-- plugins.telescope
-- plugins.tree
-- plugins.toggleterm
