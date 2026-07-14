return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        require('telescope').setup({})

        local preview_utils = require("telescope.previewers.utils")
        preview_utils.ts_highlighter = function(bufnr, ft)
            local lang = vim.treesitter.language.get_lang(ft) or ft
            if not lang or lang == "" then
                return false
            end

            return pcall(vim.treesitter.start, bufnr, lang)
        end

        local builtin = require('telescope.builtin')
        -- search the current directory
        vim.keymap.set('n', '<leader>pp', function()
            local Cdir = vim.fn.expand('%:p')
            if Cdir == "" then
                builtin.find_files()
            else
                Cdir = string.gsub(Cdir, "oil://", "");
                Cdir = string.gsub(Cdir, "[^/]+%.%w+$", "");
                print(Cdir);
                builtin.find_files({ cwd = Cdir })
            end
        end, {})
        -- fixed so even if you use this: nvim /path/to/your/project, git will be detected
        vim.keymap.set('n', '<C-p>', function()
                local Cdir = vim.fn.expand("%:p")
                Cdir = string.gsub(Cdir, "oil://", "")
                Cdir = string.gsub(Cdir, "[^/]+%.%w+$", "")
                builtin.git_files({ cwd = Cdir })
            end, {})
        vim.keymap.set('n', '<leader>pws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>pWs', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
    end
}

