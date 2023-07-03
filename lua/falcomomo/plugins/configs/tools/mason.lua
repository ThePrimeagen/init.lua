return function()
  require("mason").setup()
  require("mason-lspconfig").setup()
  require("mason-nvim-dap").setup({
    handlers = {}
  })
end
