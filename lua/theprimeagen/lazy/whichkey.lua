return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    config = function()
        local wk = require("which-key")

        wk.setup({
            plugins = {
                marks = true,
                registers = true,
                spelling = {
                    enabled = true,
                    suggestions = 20,
                },
                presets = {
                    operators = true,
                    motions = true,
                    text_objects = true,
                    windows = true,
                    nav = true,
                    z = true,
                    g = true,
                },
            },
            icons = {
                breadcrumb = "»",
                separator = "➜",
                group = "+",
            },
            window = {
                border = "rounded",
                position = "bottom",
                margin = { 1, 0, 1, 0 },
                padding = { 1, 2, 1, 2 },
                winblend = 0,
            },
            layout = {
                height = { min = 4, max = 25 },
                width = { min = 20, max = 50 },
                spacing = 3,
                align = "left",
            },
        })

        -- Register key groups for better labels
        wk.register({
            ["<leader>p"] = { name = "+project/telescope" },
            ["<leader>h"] = { name = "+git hunks" },
            ["<leader>t"] = { name = "+toggle/test" },
            ["<leader>v"] = { name = "+lsp" },
            ["<leader>e"] = { name = "+error snippets" },
            ["<leader>r"] = { name = "+refactor/notes" },
            ["<leader>z"] = { name = "+zen mode" },
            ["<leader>c"] = { name = "+cellular automaton" },
        })
    end
}
