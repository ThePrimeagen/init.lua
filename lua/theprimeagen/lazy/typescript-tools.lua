return {
    "pmizio/typescript-tools.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "neovim/nvim-lspconfig",
    },
    config = function()
        require("typescript-tools").setup {
            settings = {
                tsserver_max_memory = 8192,
                separate_diagnostic_server = false,
                code_lens = "off",
                jsx_close_tag = {
                    enable = true,
                    filetypes = { "typescriptreact", "javascriptreact" },
                },
                tsserver_plugins = {
                    "@styled/typescript-styled-plugin",
                }
            },
            opts = {
                insertSpaceAfterKeywordsInControlFlowStatements = true,
                insertSpaceAfterFunctionKeywordForAnonymousFunctions = true,
                insertSpaceAfterOpeningAndBeforeClosingNonemptyParenthesis = true,
            },
        }
    end,
}
