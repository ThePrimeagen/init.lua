vim.env.ESLINT_D_PPID = vim.fn.getpid()

return {
    "stevearc/conform.nvim",
    dependencies = {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("mason-tool-installer").setup({
            ensure_installed = {
                "php-cs-fixer",
                "jsonlint",
            },
        })
        local conform = require("conform")

        conform.setup({
            formatters = {
                ["php-cs-fixer"] = {
                    command = "php-cs-fixer",
                    args = {
                        "fix",
                        "--rules=@PSR12", -- Formatting preset. Other presets are available, see the php-cs-fixer docs.
                        "$FILENAME",
                    },
                    stdin = false,
                },
                ["jsonlint"] = {
                    command = "jsonlint",
                    args = { "--compact", "$FILENAME" },
                    stdin = false,
                },
            },
            formatters_by_ft = {
                php = { "php-cs-fixer" },
                json = { "jsonlint" },
            },
            format_after_save = {
                timeout = 500,
                lsp_fallback = true,
                async = true,
            },
        })

        vim.keymap.set({ "n", "v" }, "<leader>f", function()
            conform.format({
                lsp_fallback = true,
                async = true,
                timeout = 500,
            })
        end, { desc = "Format the current buffer or range (in visual mode)", noremap = true, silent = true })
    end,
}
