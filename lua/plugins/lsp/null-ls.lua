-----------------------------------------------------------
-- Null-ls (Formatter) configuration file
----------------------------------------------------------

local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	debug = true,
	sources = {
		code_actions.eslint_d,
		diagnostics.stylelint, -- css
		formatting.stylua, -- lua
		formatting.rustywind, -- tailwind
		completion.spell.with({
			filetypes = { "markdown" },
		}),
	},
})
