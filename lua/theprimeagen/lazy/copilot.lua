return {
    {
        "zbirenbaum/copilot.lua",
        config = function()
            -- require("copilot").setup({
            --     suggestion = { enabled = false },
            --     panel = { enabled = false },
            -- })

            require("copilot").setup({
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    hide_during_completion = false,
                    debounce = 25,
                    keymap = {
                        accept = false,
                        accept_word = false,
                        accept_line = "<Tab>",
                        next = false,
                        prev = false,
                        dismiss = false,
                    },
                },
            })
        end,
    },
    -- {
    --     "zbirenbaum/copilot-cmp",
    --     after = { "copilot.lua" },
    --     config = function()
    --         require("copilot_cmp").setup()
    --     end
    -- }
}
