return function()
  vim.opt.list = true

  require("indent_blankline").setup({
    show_end_of_line = true,
    show_current_context = true,
    use_treesitter_scope = true,
    filetype_exclude = {
      "dashboard",
      "lspinfo",
      "packer",
      "checkhealth",
      "help",
      "man",
      "",
    },
  })
end
