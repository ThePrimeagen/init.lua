
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pw", function()
    vim.cmd("w")
    vim.cmd("Ex")
end)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>fn", function() 
    local file_path = vim.fn.expand("%:p")
    vim.fn.setreg("+", file_path)
    print("Copied: " .. file_path)
end)

vim.keymap.set("n", "<leader>i", function()
  local target_buf = vim.api.nvim_get_current_buf()
  local target_win = vim.api.nvim_get_current_win()
  local word = vim.fn.expand("<cword>")

  -- Use telescope since snacks.picker doesn't exist
  require('telescope.builtin').live_grep({
    default_text = "use.*\\b" .. word .. "\\b",
    attach_mappings = function(prompt_bufnr, map)
      map('i', '<CR>', function()
        local entry = require('telescope.actions.state').get_selected_entry()
        require('telescope.actions').close(prompt_bufnr)
        if not entry then
          return
        end

        -- Get the line content
        local content = entry.text or ""

        -- Switch back to the target buffer/window
        vim.api.nvim_set_current_win(target_win)
        vim.api.nvim_set_current_buf(target_buf)

        -- Prepend use statement to file
        vim.api.nvim_buf_set_lines(target_buf, 0, 0, false, { content })
      end)
      return true
    end,
  })
end, { desc = "Search and paste use statements" })

vim.keymap.set({"n", "v"}, "<leader>c", "gc", { remap = true, desc = "Toggle comment" })

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set(
    "n",
    "<leader>ee",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

-- Rebind gd to use telescope for better go-to-definition
vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>")

vim.api.nvim_set_option("clipboard","unnamed")
