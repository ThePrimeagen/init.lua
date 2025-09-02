return {
    "tjdevries/php.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter"
    },
    config = function()
        require("php").setup({})
    end
}
