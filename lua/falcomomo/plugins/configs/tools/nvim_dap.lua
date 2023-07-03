local function keymaps_config(dap)
  vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "DAP start/continue" })
  vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP toggle breakpoint" })
  vim.keymap.set("n", "<leader>dsO", dap.step_out, { desc = "DAP step out" })
  vim.keymap.set("n", "<leader>dsi", dap.step_into, { desc = "DAP step into" })
  vim.keymap.set("n", "<leader>dso", dap.step_over, { desc = "DAP step over" })
  vim.keymap.set("n", "<leader>dS", dap.close, { desc = "DAP stop" })
  vim.keymap.set("n", "<leader>du", dap.up, { desc = "DAP up" })
  vim.keymap.set("n", "<leader>dd", dap.down, { desc = "DAP down" })
end

return function()
  local dap = require("dap")
  keymaps_config(dap)
end
