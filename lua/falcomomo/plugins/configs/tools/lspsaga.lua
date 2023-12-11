return function()
    -- Highlights
    vim.api.nvim_set_hl(0, "SagaNormal", { link = "Normal" })
    vim.api.nvim_set_hl(0, "SagaBorder", { link = "Normal" })
    vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
            vim.api.nvim_set_hl(0, "SagaNormal", { link = "Normal" })
            vim.api.nvim_set_hl(0, "SagaBorder", { link = "Normal" })
        end,
    })
    require("lspsaga").setup({
        code_action = {
            keys = {
                quit = { "q", "<Esc>" },
            },
        },
        ui = {
            code_action = "",
            border = "rounded",
            winblend = 10
        },
        outline = {
            keys = {
                quit = "q",
                expand_or_jump = "<CR>",
            },
        },
        definition = {
            quit = { "q", "<Esc>" },
        },
        finder = {
            keys = {
                expand_or_jump = "<CR>",
                quit = { "q", "<ESC>" },
            },
        },
    })

    local goto_definition_stack = {}

    local function goto_definition_mark()
        -- Insert current buffer position into a stack before jumping to definition
        local curr_buff = vim.api.nvim_get_current_buf()
        local cursor_pos = vim.api.nvim_win_get_cursor(0)
        local marker_info = { curr_buff, cursor_pos }
        table.insert(goto_definition_stack, marker_info)
        vim.cmd("Lspsaga goto_definition")
    end

    local function go_back_from_definition()
        -- Get last mark in the go to definition stack
        local marker_info = table.remove(goto_definition_stack)

        if not marker_info then
            return
        end

        local buff_info, cursor_info = marker_info[1], marker_info[2]
        vim.api.nvim_set_current_buf(buff_info)
        vim.api.nvim_win_set_cursor(0, cursor_info)
    end

    -- Keymaps
    vim.keymap.set("n", "gd", "<Cmd>Lspsaga peek_definition<CR>", { desc = "Peek to definition" })
    vim.keymap.set("n", "gD", goto_definition_mark, { desc = "Jump to definition" })
    vim.keymap.set("n", "gb", go_back_from_definition, { desc = "Jump back from definition" })
    vim.keymap.set("n", "<leader>lD", "<Cmd>Lspsaga peek_type_definition<CR>", { desc = "Type definition" })
    vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", { desc = "Hover" })
    vim.keymap.set("n", "<leader>lo", "<Cmd>Lspsaga outline<CR>", { desc = "Show outline" })
    vim.keymap.set("n", "<leader>lr", "<Cmd>Lspsaga rename ++project<CR>", { desc = "Rename in project" })
    vim.keymap.set({ "n", "v" }, "<leader>la", "<Cmd>Lspsaga code_action<CR>", { desc = "Code actions" })
    vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { desc = "LSP finder" })
end
