return {
	{
		"echasnovski/mini.map",
		version = false,
		config = function()
			local map = require("mini.map")

			map.setup({
				integrations = {
					map.gen_integration.builtin_search(), -- highlights search matches
					map.gen_integration.diagnostic(), -- show LSP diagnostics
					map.gen_integration.gitsigns(), -- show git changes
				},
				symbols = {
					-- Different encodings for how text is displayed in minimap
					-- Try "block", "dot", or "hash"
					encode = map.gen_encode_symbols.dot("3x2"),
				},
				window = {
					side = "right", -- minimap on the right side
					width = 20, -- width of minimap
					winblend = 25, -- transparency (0 = opaque, 100 = invisible)
				},
			})

			-- Keymaps
			vim.keymap.set("n", "<leader>mm", map.toggle, { desc = "Toggle minimap" })
			vim.keymap.set("n", "<leader>mo", map.open, { desc = "Open minimap" })
			vim.keymap.set("n", "<leader>mc", map.close, { desc = "Close minimap" })
		end,
	},
}
