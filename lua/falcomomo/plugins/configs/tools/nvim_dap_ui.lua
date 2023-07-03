return function()
  local dapui = require("dapui")
  dapui.setup()

  vim.keymap.set("n", "<leader>dt", dapui.toggle, { desc = "DAP toggle UI" })
end
