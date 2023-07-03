local editor = {
    --  Nerd Commenter
    {
        "preservim/nerdcommenter",
        event = "BufEnter",
    },
    -- Vim visual multi
    {
        "mg979/vim-visual-multi",
        event = "BufEnter",
    },
    -- Cmp
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "onsails/lspkind.nvim",
            "saadparwaiz1/cmp_luasnip",
        },
        version = false, -- last release is way too old
        event = "InsertEnter",
        config = require("editor.cmp"),
    },
    -- Luasnip
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
        config = require("editor.luasnip"),
    },
    -- Nvim auto-pairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/nvim-cmp"
        },
        config = require("editor.nvim_autopairs"),
    },
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        config = require("editor.nvim_surround"),
    },
}
return editor
