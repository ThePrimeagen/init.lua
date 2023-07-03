return function()
  require("luasnip.loaders.from_vscode").lazy_load()
  require("luasnip").setup({
    region_check_events = "InsertEnter",
    delete_check_events = "TextChanged,InsertLeave",
  })
end
