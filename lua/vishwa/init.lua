require("vishwa.set")
require("vishwa.remap")
require("vishwa.lazy_init")

local augroup = vim.api.nvim_create_augroup
local vishwaGroup = augroup("vishwa", {})
local lspconfig = require("lspconfig")

lspconfig.ts_ls.setup({
	on_attach = function(client, bufnr)
		-- disable formatting if using prettier/eslint
		client.server_capabilities.documentFormattingProvider = false
	end,
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "jsx" },
})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

function R(name)
	require("plenary.reload").reload_module(name)
end

vim.filetype.add({
	extension = {
		templ = "templ",
	},
})

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

autocmd({ "BufWritePre" }, {
	group = vishwaGroup,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

autocmd("BufEnter", {
	group = vishwaGroup,
	callback = function()
		if vim.bo.filetype == "zig" then
			pcall(vim.cmd.colorscheme, "tokyonight-night")
		else
			pcall(vim.cmd.colorscheme, "rose-pine-moon")
		end
	end,
})

autocmd("LspAttach", {
	group = vishwaGroup,
	callback = function(e)
		local opts = { buffer = e.buf }
		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, opts)
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, opts)
		vim.keymap.set("n", "<leader>vws", function()
			vim.lsp.buf.workspace_symbol()
		end, opts)
		vim.keymap.set("n", "<leader>vd", function()
			vim.diagnostic.open_float()
		end, opts)
		vim.keymap.set("n", "<leader>vca", function()
			vim.lsp.buf.code_action()
		end, opts)
		vim.keymap.set("n", "<leader>vrr", function()
			vim.lsp.buf.references()
		end, opts)
		vim.keymap.set("n", "<leader>vrn", function()
			vim.lsp.buf.rename()
		end, opts)
		vim.keymap.set("i", "<C-h>", function()
			vim.lsp.buf.signature_help()
		end, opts)
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.goto_next()
		end, opts)
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.goto_prev()
		end, opts)
	end,
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
