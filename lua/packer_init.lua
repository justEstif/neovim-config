-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------
-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap =
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
	})

	use({ -- lsp/formating
		"neovim/nvim-lspconfig", -- nvim native lsp
		"williamboman/nvim-lsp-installer", -- lsp  installer
		"jose-elias-alvarez/null-ls.nvim", -- formatter
	})

	use({ -- completion/cmp
		"hrsh7th/nvim-cmp", -- cmp plugin
		"hrsh7th/cmp-nvim-lsp", -- lsp cmp
		"hrsh7th/cmp-path", -- path cmp
		"hrsh7th/cmp-buffer", -- buffer cmp
		"saadparwaiz1/cmp_luasnip", -- snippets cmp
		"L3MON4D3/LuaSnip", -- snippets engine
		"rafamadriz/friendly-snippets", -- snippets
	})

	use({ -- telescope
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = { "nvim-lua/plenary.nvim" },
	})

	use({ -- comment
		"numToStr/Comment.nvim",
		"JoosepAlviste/nvim-ts-context-commentstring",
	})

	use({
		"kyazdani42/nvim-tree.lua", -- file explorer
		"kyazdani42/nvim-web-devicons", -- icons
		"feline-nvim/feline.nvim", -- statusline
		"goolord/alpha-nvim", -- dashboard
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	use({ -- git labels
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup()
		end,
	})

	use({
		"lukas-reineke/indent-blankline.nvim", -- indent line
		"windwp/nvim-autopairs", -- autopair
	})

	use({ -- sneak
		"phaazon/hop.nvim",
		branch = "v2",
		config = function()
			require("hop").setup({})
		end,
	})

	use({ -- buffer delete -> keymapped
		"famiu/bufdelete.nvim",
		config = function()
			require("bufdelete").bufdelete(0, true)
		end,
	})

	use({ -- quick surround
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup()
		end,
	})

	use("navarasu/onedark.nvim") -- colorschemes: onedark
	use("wakatime/vim-wakatime") -- wakatime

	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
