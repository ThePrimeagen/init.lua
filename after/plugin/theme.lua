require("catppuccin").setup({
  flavor = "mocha",
  integrations = {
    treesitter = true,
    indent_blankline = {
      enabled = true,
      scope_color = "",
      colored_indent_levels = false
    },
  }
})

vim.cmd.colorscheme "catppuccin"
