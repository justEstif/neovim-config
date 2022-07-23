-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------
-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
  vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install plugins
return packer.startup(function(use)

  use 'wbthomason/packer.nvim' -- packer
  use 'kyazdani42/nvim-tree.lua' -- file explorer
  use 'nvim-treesitter/nvim-treesitter' -- Treesitter Interface
  use 'wakatime/vim-wakatime' -- Wakatime

  use 'lukas-reineke/indent-blankline.nvim' -- indent line
  use 'kyazdani42/nvim-web-devicons' -- Icons
  use 'navarasu/onedark.nvim' -- colorschemes: onedark

  use { -- statusline
    'feline-nvim/feline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  use { -- git labels
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end
  }

  use { -- autopair
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  }

  use { -- lsp
    "williamboman/nvim-lsp-installer",
    "neovim/nvim-lspconfig",
  }

  use { -- completion
    'hrsh7th/nvim-cmp', -- cmp plugin
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path', -- path cmp
    'hrsh7th/cmp-buffer', -- buffer cmp
    'saadparwaiz1/cmp_luasnip', -- snippets cmp
    'L3MON4D3/LuaSnip', -- snippets engine
    'rafamadriz/friendly-snippets', -- snippets
  }

  use { -- dashboard
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  use { -- sneak
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function()
      require('hop').setup({})
    end
  }

  use { -- buffer delete
    'famiu/bufdelete.nvim',
    config = function()
      require('bufdelete').bufdelete(0, true)
    end
  }

  use { -- telescope
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  use({ -- surround
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup()
    end
  })

  use { -- comment
    'numToStr/Comment.nvim',
    "JoosepAlviste/nvim-ts-context-commentstring"
  }

  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
