local tools = {
    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        config = require("tools.telescope"),
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            "nvim-telescope/telescope-symbols.nvim",
            "nvim-telescope/telescope-project.nvim",
            "nvim-telescope/telescope-dap.nvim",
            --"nvim-telescope/telescope-yank-history.nvim"
        },
        event = "VeryLazy",
    },
    -- Telescope fzf plugin
    {
        "nvim-telescope/telescope-fzf-native.nvim", build = "make",
    },
    -- Yanky
    {
        "gbprod/yanky.nvim",
        config = require("tools.yanky"),
    },
    -- Harpoon
    {
        "theprimeagen/harpoon",
        config = require("tools.harpoon")
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        --branch = 'v1.x',
        config = require("tools.lspzero"),
        dependencies = {
                    -- LSP Support
            {
                'neovim/nvim-lspconfig',
                config = require("tools.lspconfig"),
            },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
                    {
                        "glepnir/lspsaga.nvim",
                        config = require("tools.lspsaga"),
                        event = "LspAttach",
                        dependencies = {
                            { "nvim-tree/nvim-web-devicons" },
                            { "nvim-treesitter/nvim-treesitter" },
                        },
                    },
                    -- LSP signature
                    {
                        "ray-x/lsp_signature.nvim",
                        config = require("tools.lsp_signature"),
                    },
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
    },
                    -- Navbuddy
                    {
                        "SmiteshP/nvim-navbuddy",
                        config = require("tools.navbuddy"),
                        dependencies = {
                            "SmiteshP/nvim-navic",
                            "MunifTanjim/nui.nvim",
                        },
                    },
    -- Neodev
    {
        "folke/neodev.nvim",
        config = require("tools.neodev"),
    },
    {
        'williamboman/mason.nvim',
        build = ":MasonUpdate",
        config = require("tools.mason"),
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "jay-babu/mason-nvim-dap.nvim",
        }
    },
    -- Trouble
    {
        "folke/trouble.nvim",
        config = require("tools.trouble"),
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    -- Fugitive
    {
        "tpope/vim-fugitive"
    },
    -- Lazygit as an alternative to fugitive
    {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    -- Merginal
    {
        "idanarye/vim-merginal"
    },
    -- Undo-tree
    {
        "mbbill/undotree"
    },
    -- Nvim DAP
    {
        "mfussenegger/nvim-dap",
        config = require("tools.nvim_dap"),
    },
    -- Nvim DAP UI
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap" },
        config = require("tools.nvim_dap_ui"),
    },
    -- Peek
    {
        "toppair/peek.nvim",
        config = require("tools.peek"),
        build = "deno task --quiet build:fast",
    },
    -- Diffview
    {
        "sindrets/diffview.nvim",
        config = require("tools.diffview"),
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "VeryLazy",
    },

}

return tools
