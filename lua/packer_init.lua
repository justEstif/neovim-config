-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.o.runtimepath = vim.fn.stdpath("data") .. "/site/pack/*/start/*," .. vim.o.runtimepath
end

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Install plugins
return packer.startup(function(use)
	use({
		"wbthomason/packer.nvim", -- plugin manager
		"nvim-lua/plenary.nvim", -- important package used by most
		"nvim-treesitter/nvim-treesitter", -- code highlighting
		"kyazdani42/nvim-tree.lua", -- file explorer
	})

	use({ -- lsp/formating
		"neovim/nvim-lspconfig", -- nvim native lsp
		"williamboman/nvim-lsp-installer", -- lsp installer
		"jose-elias-alvarez/null-ls.nvim", -- formatter
	})

	use({ -- completion/cmp
		"hrsh7th/nvim-cmp", -- cmp plugin
		"hrsh7th/cmp-nvim-lsp", -- lsp cmp
		"hrsh7th/cmp-path", -- path cmp
		"hrsh7th/cmp-buffer", -- buffer cmp
		"saadparwaiz1/cmp_luasnip", -- snippets cmp
		"L3MON4D3/LuaSnip", -- snippets engine
		"rafamadriz/friendly-snippets", -- common snippets
	})

	use({ -- telescope
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = "nvim-lua/plenary.nvim",
	})

	use({
		"numToStr/Comment.nvim", -- comments
		"JoosepAlviste/nvim-ts-context-commentstring", -- jsx comments
		"windwp/nvim-ts-autotag", -- autoclose and autorename html tags
	})

	use({
		"folke/todo-comments.nvim", -- todo comment highlighting
		requires = "nvim-lua/plenary.nvim",
	})

	use({ -- dashboard
		"goolord/alpha-nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})

	use({
		"lukas-reineke/indent-blankline.nvim", -- indent line
		"windwp/nvim-autopairs", -- autopair
	})

	use({ -- git labels
		"lewis6991/gitsigns.nvim",
		requires = "nvim-lua/plenary.nvim",
	})

	use({
		"kylechui/nvim-surround", -- quick surround
		"feline-nvim/feline.nvim", -- statusline
		"wakatime/vim-wakatime", -- wakatime
	})

	use({ "kyazdani42/nvim-web-devicons" }) -- icons
	use({ "akinsho/toggleterm.nvim", tag = "v2.*" }) -- better terminal
	use({ "EdenEast/nightfox.nvim", tag = "v1.0.0" }) -- colorscheme
	use({ "phaazon/hop.nvim", branch = "v2" }) -- sneak with s
	use({ "echasnovski/mini.nvim" }) -- clever f

	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
