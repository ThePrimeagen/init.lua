return {
    'prettier/vim-prettier',
    config = function()
        vim.g['prettier#autoformat'] = 1
        vim.api.nvim_set_keymap('n', '<leader>l', ':Prettier<CR>', { noremap = true, silent = true})
    end,
}
