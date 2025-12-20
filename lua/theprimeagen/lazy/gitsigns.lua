return {
    "lewis6991/gitsigns.nvim",
    config = function()
        local gs = require("gitsigns")

        gs.setup({
            preview_config = {
                border = "rounded",
                style = "minimal",
            },
        })

        vim.keymap.set("n", "<leader>g", gs.preview_hunk, { desc = "Gitsigns: preview hunk" })
        vim.keymap.set("n", "<leader>r", gs.reset_hunk, { desc = "Gitsigns: reset hunk" })
    end
}