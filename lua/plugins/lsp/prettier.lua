-----------------------------------------------------------
-- Prettier configuration file
----------------------------------------------------------

local status, prettier = pcall(require, "nvim-ts-autotag")
if not status then
	return
end

prettier.setup({
	bin = "prettierd", -- or `prettier`
	filetypes = {
		"css",
		"graphql",
		"html",
		"javascript",
		"javascriptreact",
		"json",
		"less",
		"markdown",
		"scss",
		"typescript",
		"typescriptreact",
		"yaml",
	},
	cli_options = {
		semi = false,
	},
})
