
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use ({
	"nvim-lua/plenary.nvim",
  })

  use ({
	  "nvim-telescope/telescope.nvim", 
	  branch = '0.1.x',
	  requires = {{'nvim-lua/plenary.nvim'}}
  })

  use ({
	  'nvim-treesitter/nvim-treesitter',
	  run = ':TSUpdate'
  })

  use ({
	  "folke/tokyonight.nvim",
  })

  use ({
	  'ThePrimeagen/harpoon'
  })

  use ({
	  'mbbill/undotree'
  })

  use ({
	  'tpope/vim-fugitive'
  })
  --lsp:
  use({ "williamboman/mason.nvim" })
  use({ "williamboman/mason-lspconfig.nvim" })
  use({ "neovim/nvim-lspconfig" })

  --completion:
  use({ "hrsh7th/nvim-cmp" })
  use({ "hrsh7th/cmp-nvim-lsp" })
  use({ "L3MON4D3/LuaSnip" })

  --file explorer:
  use({ "MunifTanjim/nui.nvim" })
  use({ "nvim-tree/nvim-web-devicons" })

  use({
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      requires = {
          "nvim-lua/plenary.nvim",
          "MunifTanjim/nui.nvim",
          "nvim-tree/nvim-web-devicons" 
      },
  })
  --buf tabs
  use({ "romgrk/barbar.nvim", requires = "nvim-tree/nvim-web-devicons" })

  use ({
      "folke/snacks.nvim"
  })


  use({
      "akinsho/toggleterm.nvim", tag = "*" 
  })

  use({
      "echasnovski/mini.nvim" 
  })

  use({
      "nvim-lualine/lualine.nvim",
      requires = "nvim-tree/nvim-web-devicons" 
  })

  use({
      "folke/noice.nvim",
      requires = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" } 
  })
  use({
      "rcarriga/nvim-notify" 
  })

  use({
      "lukas-reineke/indent-blankline.nvim" 
  })
end)
