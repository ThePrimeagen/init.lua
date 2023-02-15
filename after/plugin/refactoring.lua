local ok, plugin = pcall(require, 'refactoring')
if not ok then return end

plugin.setup({})
vim.api.nvim_set_keymap("v", "<leader>ri", [[ <Esc><Cmd>lua plugin.refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})
