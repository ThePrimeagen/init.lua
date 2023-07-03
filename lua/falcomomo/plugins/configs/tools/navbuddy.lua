return function()
    local navbuddy = require("nvim-navbuddy")
    local actions = require("nvim-navbuddy.actions")

    navbuddy.setup({
        window = {
            border = "rounded", -- "rounded", "double", "solid", "none"
        },
        mappings = {
            ["<S-Tab>"] = actions.parent(),   -- Move to left panel
            ["<Tab>"] = actions.children(),   -- Move to right panel
            ["<Left>"] = actions.parent(),    -- Move to left panel
            ["<Right>"] = actions.children(), -- Move to right panel
        },
        lsp = { auto_attach = true },
    })

    vim.keymap.set("n", "<leader>ln", "<Cmd>Navbuddy<CR>", { desc = "Open Navbuddy" })
end
