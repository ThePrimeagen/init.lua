return function()
    require('telescope').setup({
        pickers = {
            current_buffer_fuzzy_find = {
                winblend = 10,
                preview_title = false,
                results_title = false,
                theme = "ivy",
                layout_config = {
                    height = 15
                },
            },
        },
        commands = {
            theme = "dropdown",
            layout_config = {
                anchor = "N",
            },
        },
        colorscheme = {
            enable_preview = true,
            theme = "dropdown",
            layout_config = {
                anchor = "N",
            },
        },
        extensions = {
            fzf = {
                fuzzy = true,                   -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true,    -- override the file sorter
                case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            },
            ["file_browser"] = {
                hijack_netrw = true,
                mappings = {
                    ["i"] = {
                        ["<M-CR>"] = require("telescope").extensions.file_browser.actions.create_from_prompt
                    }
                },
            },
            ["ui-select"] = {
                theme = "dropdown"
            },
            ["yank_history"] = {

            }

        }
    })
    -- To get fzf loaded and working with telescope, you need to call
    -- load_extension, somewhere after setup function:
    require('telescope').load_extension('fzf')
    require('telescope').load_extension('file_browser')
    require('telescope').load_extension('ui-select')
    require('telescope').load_extension('notify')
    require('telescope').load_extension('project')
    require('telescope').load_extension('dap')
    require('telescope').load_extension('yank_history')
    local builtin = require('telescope.builtin')
    local extensions = require('telescope').extensions

    local function fuzzy_find_under_cursor()
        local word_under_cursor = vim.fn.expand("<cword>")
        builtin.current_buffer_fuzzy_find({ default_text = word_under_cursor })
    end

    vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "Find files" })
    vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = "Recent files" })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Open buffers" })
    vim.keymap.set('n', '<leader>fy', extensions.yank_history.yank_history, { desc = "Yank history" })
    vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Git files" })
    vim.keymap.set('n', '<M-x>', builtin.commands, { desc = "Commands" })
    vim.keymap.set('n', '<leader>ps', function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end)
    vim.keymap.set('n', '<leader>hh', builtin.help_tags, { desc = "Help tags" })
    vim.keymap.set('n', '<leader>hk', builtin.keymaps, { desc = "Describe keymaps" })
    vim.keymap.set('n', '<leader>hm', builtin.man_pages, { desc = "Man pages" })
    vim.keymap.set('n', '/', builtin.current_buffer_fuzzy_find, { desc = "Fuzzy find in file" })
    vim.keymap.set('n', '*', fuzzy_find_under_cursor, { desc = "Fuzzy find in file" })
    vim.keymap.set('n', '<leader>ff', extensions.file_browser.file_browser, { desc = "File browser" })
    vim.keymap.set('n', '<leader>pp', extensions.project.project, { desc = "Project" })
end
