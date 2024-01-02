return {

    {
        "nvim-lua/plenary.nvim",
        name = "plenary"
    },

    {
        "folke/trouble.nvim",
        config = function()
            -- TODO: I don't care, but maybe i should...
            require("trouble").setup {
                icons = false,
            }
        end
    },

    "github/copilot.vim",
    "eandrju/cellular-automaton.nvim",
}

