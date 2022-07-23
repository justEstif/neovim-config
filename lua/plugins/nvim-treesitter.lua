-----------------------------------------------------------
-- Treesitter configuration file
----------------------------------------------------------

-- Plugin: nvim-treesitter
-- url: https://github.com/nvim-treesitter/nvim-treesitter

local status_ok, nvim_treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  return
end

nvim_treesitter.setup {
  ensure_installed = {
    'css', 'html', 'javascript', 'json', 'lua', 'python',
    'typescript', 'vim', "comment"
  },
  sync_install = false,
  highlight = {
    enable = true,    -- enable extension
  },
  auto_install = true, -- auto install when missing parsers
}

-- comment parser is for TODO highlighting
