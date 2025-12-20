function ColorMyPencils(color)
	color = color or "catppuccin"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {

    {
        "erikbackman/brightburn.vim",
    },

    {
        "AlexvZyl/nordic.nvim",
        lazy = true,
        config = function()
            -- Keep Nordic installed, but don't set it as the default colorscheme.
        end
    },

    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                disable_background = true,
                styles = {
                    italic = false,
                },
            })
        end
    },

    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        lazy = false,
        config = function()
            require("catppuccin").setup({
                flavour = "macchiato", -- latte, frappe, macchiato, mocha
                background = { -- :h background
                    light = "latte",
                    dark = "macchiato",
                },
                transparent_background = false,
                show_end_of_buffer = false,
                term_colors = false,
                dim_inactive = {
                    enabled = false,
                    shade = "dark",
                    percentage = 0.15,
                },
                no_italic = true, -- Force no italic
                no_bold = false, -- Force no bold
                no_underline = false, -- Force no underline
                styles = {
                    comments = { "italic" },
                    conditionals = { "italic" },
                },
                color_overrides = {},
                custom_highlights = function(c)
                    return {
                        -- Function parameters: make them match normal text (avoid "error red" look)
                        ["@parameter"] = { fg = c.text },
                        ["@variable.parameter"] = { fg = c.text },
                        ["@lsp.type.parameter"] = { fg = c.text },

                        -- Comments: dimmer / more "transparent"
                        Comment = { fg = c.overlay0, italic = false },
                    }
                end,
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    nvimtree = true,
                    treesitter = true,
                    notify = false,
                    mini = {
                        enabled = true,
                        indentscope_color = "",
                    },
                },
            })
        end,
    },


}
