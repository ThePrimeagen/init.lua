return {
    "Exafunction/codeium.nvim",
    config = function()
        require("codeium").setup({
            enable_chat = false,
            enterprise_mode = false,
            enable_cmp_source = true,
            virtual_text = {
                enabled = true,
                manual = false,
                idle_delay = 75,
                key_bindings = {
                    accept = "<Tab>",
                    accept_word = false,
                    accept_line = false,
                    next = "<M-]>",
                    prev = "<M-[>",
                    clear = "<C-]>",
                }
            }
        })
    end,
}