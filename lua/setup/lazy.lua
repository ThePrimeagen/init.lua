local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "

local plugins = {
  'nvim-tree/nvim-web-devicons',
  'lewis6991/gitsigns.nvim',
  'lukas-reineke/headlines.nvim',
  'dhruvasagar/vim-table-mode',
  'folke/trouble.nvim',
  "nvim-treesitter/playground",
  "theprimeagen/harpoon",
  "github/copilot.vim",
  "eandrju/cellular-automaton.nvim",
  "laytan/cloak.nvim",
  "mg979/vim-visual-multi",
  "theprimeagen/refactoring.nvim",
  "mbbill/undotree",
  "nvim-treesitter/nvim-treesitter-context",
  'lukas-reineke/indent-blankline.nvim',
  {
    "jackMort/ChatGPT.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },
  {
    'nvim-telescope/telescope.nvim',
    version = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      lazy = true
    }
  },

}

local opts = {}

require("lazy").setup(plugins, opts)
