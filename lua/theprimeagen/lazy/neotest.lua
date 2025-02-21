return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "fredrikaverpil/neotest-golang",
        "leoluz/nvim-dap-go",
    },
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-golang")({
                    dap = { justMyCode = false },
                }),
            },
        })
    end
}
