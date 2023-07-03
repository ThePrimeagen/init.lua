-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim',
	  -- or                            , branch = '0.1.x',
	  requires = { 'nvim-lua/plenary.nvim',
                    'nvim-telescope/telescope-file-browser.nvim',
                    'nvim-telescope/telescope-ui-select.nvim',
                    'nvim-telescope/telescope-symbols.nvim',
                    'nvim-telescope/telescope-project.nvim',
                    'nvim-telescope/telescope-dap.nvim'
   }
  }


  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

use({
  'mrjones2014/legendary.nvim',
  -- sqlite is only needed if you want to use frecency sorting
  -- requires = 'kkharji/sqlite.lua'
})

use {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}
use {"Cassin01/wf.nvim", tag = "*", config = function() require("wf").setup() end}

use {
    "SmiteshP/nvim-navbuddy",
    requires = {
        "neovim/nvim-lspconfig",
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim"
    }
}

use("mg979/vim-visual-multi")

  use({'Mofiqul/dracula.nvim',
  config = function()
      vim.cmd('colorscheme dracula')
  end
})

use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}


use("lukas-reineke/indent-blankline.nvim")

  use({
      "folke/trouble.nvim",
      config = function()
          require("trouble").setup {
              icons = false,
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
          }
      end
  })


  use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"})
  use("nvim-treesitter/playground")
  use("theprimeagen/harpoon")
  use("theprimeagen/refactoring.nvim")
  use("mbbill/undotree")
  use("tpope/vim-fugitive")
  use("idanarye/vim-merginal")
  use("nvim-treesitter/nvim-treesitter-context");
  use("preservim/nerdcommenter")
    use("jiangmiao/auto-pairs")
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }
  use {"glepnir/lspsaga.nvim",  branch = "main",  requires = {{"nvim-tree/nvim-web-devicons"}, {"nvim-treesitter/nvim-treesitter"}}}
  use("mfussenegger/nvim-dap")

  use("folke/zen-mode.nvim")
  use("github/copilot.vim")
  use("eandrju/cellular-automaton.nvim")
  use("laytan/cloak.nvim")

  use{"folke/noice.nvim", requires = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" }}

  -- my plugins
  use "~/dev/projects/whatsoccurring.nvim"
end)

