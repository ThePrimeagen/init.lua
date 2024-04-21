vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- A function to move selected lines down in visual mode
function move_lines_down_visual()
	local current_line = vim.api.nvim_win_get_cursor(0)[1]
	local last_line = vim.api.nvim_buf_line_count(0)

	local selected_lines_count = vim.fn.line("'>") - vim.fn.line("'<")

	if current_line + selected_lines_count < last_line then
		vim.api.nvim_command("'<, '>m '>+1")
		vim.api.nvim_command("normal! gv=gv")
	-- When we hit the bottom we just reselect the lines
	else
		vim.api.nvim_command("normal! gv")
	end
end

-- A function to move selected lines up in visual mode
function move_lines_up_visual()
	local current_line = vim.api.nvim_win_get_cursor(0)[1]

	if current_line > 1 then
		vim.api.nvim_command("'<, '>m '<-2")
		vim.api.nvim_command("normal! gv=gv")
	-- When we hit the top we just reselect the lines
	else
		vim.api.nvim_command("normal! gv")
	end
end

vim.keymap.set('v', 'J', ':lua move_lines_down_visual()<CR>')
vim.keymap.set('v', 'K', ':lua move_lines_up_visual()<CR>')

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

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

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

