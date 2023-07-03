return function()
  require("illuminate").configure({
    filetypes_denylist = {
      "NeogitStatus",
      "dashboard",
    },
    modes_allowlist = { "n", "i" },
  })
  vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
  vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
  vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
end
