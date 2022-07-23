-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a comma
vim.g.mapleader = ','

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

map('i', 'jk', '<Esc>') -- map esc to jk

map('n', 'H', '_') -- H to go the start of line(n)
map('v', 'H', '_') -- H to go the start of line(v)
map('n', 'L', '$') -- L to go to the end of line(n)
map('v', 'L', '$') -- L to go to the end of line(v)
map('n', 'J', '}') -- J to jump previous blocks(n)
map('v', 'J', '}') -- J to jump previous blocks(v)
map('n', 'K', '{') -- L to jump next blocks(n)
map('v', 'K', '{') -- L to jump next blocks(v)
map("n", '"', '%') -- ' to jump to matching closer
map("v", '"', '%') -- ' to jump to matching bracket

map("n", '<A-j>', ":m .+1<CR>==") -- move line up(n)
map("n", '<A-k>', ":m .-2<CR>==") -- move line down(n)
map("v", '<A-j>', ":m '>+1<CR>gv=gv") -- move line up(v)
map("v", '<A-k>', ":m '<-2<CR>gv=gv") -- move line down(v)
map("i", '<A-j>', "<Esc>:m .+1<CR>==gi") -- move line up(i)
map("i", '<A-k>', "<Esc>:m .-2<CR>==gi") -- move line down(i)

-- Window
map('n', '<C-k>', '<C-w>k') -- window up
map('n', '<C-h>', '<C-w>h') -- window left
map('n', '<C-j>', '<C-w>j') -- window down
map('n', '<C-l>', '<C-w>l') -- window right

-- Buffers
map('n', '<leader>bn', ':bn<CR>') -- next buffer(n)
map('n', '<leader>bp', ':bp<CR>') -- previous buffer(n)
map('n', '<leader>bk', ':Bdelete<CR>') -- kill current buffer(n)
map('n', '<leader>bl', ':Telescope buffers<CR>') -- list all buffers

-- Tabs
map('n', '<leader>tt', ':tabedit<CR>') -- open buffer in new tab
map('n', '<leader>tn', ':tabnext<CR>') -- go to next tab
map('n', '<leader>tp', ':tabprev<CR>') -- go to prev tab
map('n', '<leader>tk', ':tabclose<CR>') -- kill current tab

map('n', '<leader>j', 'gJ') -- leader j to join lines(n)
map('v', '<leader>j', 'gJ') -- leader j to join lines(v)

map('n', '<leader>s', ':w<CR>') -- save file
map('n', '<leader>c', ':nohl<CR>') -- clear search highlights
map('n', '<leader>r', ':so %<CR>') -- Reload configuration without restart nvim
map('n', '<leader>q', ':qa!<CR>') -- force exit

-- gx to open link under cursor
map("n", "gx", "<cmd>silent execute '!open ' . shellescape('<cWORD>')<CR>")

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Terminal mappings
map('n', '<C-t>', ':Term<CR>', { noremap = true }) -- open
map('t', '<Esc>', '<C-\\><C-n>') -- exit

-- NvimTree
map('n', '<C-n>', ':NvimTreeToggle<CR>') -- open/close

-- Telescope
map('n', '<leader>bl', ':Telescope buffers<CR>') -- list all buffers
map("n", "<C-p>", ":Telescope find_files<CR>", { noremap = true }) -- find file
map("n", "ms", ":Telescope current_buffer_fuzzy_find<CR>") -- find text in current file
map("n", "mS", ":Telescope live_grep<CR>") -- find text in directory
-- '<leader>bl':  list all buffers; defined in the buffers section

-- Hop
map("n", "s", "<cmd>HopPattern<CR>")
map("n", "ml", "<cmd>HopLineStart<CR>")

--- lsp in
-- 'gd',         : Definition
-- '<space>h',   : hover
-- '<space>D',   : type definition
-- '<space>rn',  : rename
-- '<space>ca',  : code action
-- '<space>e',   : show linediagnostics
-- '<space>f',   : format
