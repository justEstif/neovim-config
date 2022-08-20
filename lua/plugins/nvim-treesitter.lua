-----------------------------------------------------------
-- Nvim Treesitter configuration file
----------------------------------------------------------

local status_ok, nvim_treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

nvim_treesitter.setup({
	ensure_installed = {
		"css",
		"html",
		"javascript",
		"json",
		"lua",
		"python",
		"typescript",
		"vim",
		"comment",
	},
	sync_install = false,
	highlight = {
		enable = true, -- enable extension
		additional_vim_regex_highlighting = true,
	},
	auto_install = true, -- auto install when missing parsers

  -- Comment settings
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
