return function()
  require("trouble").setup({
    height = 15,
    action_keys = { -- key mappings for actions in the trouble list
      jump = { "o", "<tab>" }, -- jump to the diagnostic or open / close folds
      jump_close = { "<cr>" }, -- jump to the diagnostic and close the list
    },
  })

  vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { desc = "Trouble", silent = true, noremap = true })
  vim.keymap.set(
    "n",
    "<leader>xw",
    "<cmd>TroubleToggle workspace_diagnostics<cr>",
    { desc = "Trouble workspace", silent = true, noremap = true }
  )
  vim.keymap.set(
    "n",
    "<leader>xd",
    "<cmd>TroubleToggle document_diagnostics<cr>",
    { desc = "Trouble document", silent = true, noremap = true }
  )
  vim.keymap.set(
    "n",
    "<leader>xl",
    "<cmd>TroubleToggle loclist<cr>",
    { desc = "Trouble loclist", silent = true, noremap = true }
  )
  vim.keymap.set(
    "n",
    "<leader>xq",
    "<cmd>TroubleToggle quickfix<cr>",
    { desc = "Trouble quickfix", silent = true, noremap = true }
  )
  vim.keymap.set(
    "n",
    "gR",
    "<cmd>TroubleToggle lsp_references<cr>",
    { desc = "Trouble LSP references", silent = true, noremap = true }
  )
end
