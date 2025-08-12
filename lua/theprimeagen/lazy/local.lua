local local_plugins = {
	--{
	--    "vim-guys",
	--    dir = "~/personal/vim-guys",
	--    config = function()
	--    end,
	--},
	--{
	--    "cockpit",
	--    dir = "~/personal/cockpit",
	--    config = function()
	--        require("cockpit")
	--        vim.keymap.set("n", "<leader>ct", "<cmd>CockpitTest<CR>")
	--        vim.keymap.set("n", "<leader>cr", "<cmd>CockpitRefresh<CR>")
	--    end,
	--},

	{
		"the-stru",
		dir = "~/personal/the-stru",
	},
	{
		"cursor_agent",
		dir = "~/personal/cursor_in_neovim/",
		dependencies = { "nvim-lua/plenary.nvim" }, -- optional, improves HTTP; falls back to curl if absent
		config = function()
			require("cursor_agent").setup({
				-- optional config
				ui = {
					width = 60, -- panel width in columns
					input_height = 3, -- input box height
					border = "rounded",
				},
				provider = {
					name = "openai", -- or "anthropic"
					openai = {
						model = "gpt-4o-mini",
					},
					anthropic = {
						model = "claude-3-5-sonnet-20240620",
						version = "2023-06-01",
						max_tokens = 1024,
					},
				},
			})
		end,
	},

	{
		"streamer",
		dir = "~/personal/eleven-streamer",
		config = function()
			vim.keymap.set("n", "<leader>er", function()
				require("streamer").reload()
			end)
			vim.keymap.set("n", "<leader>es", function()
				require("streamer").twitch_dashboard()
			end)
			vim.keymap.set("n", "<leader>en", function()
				require("streamer").twitch_dashboard():stop()
			end)
		end,
	},

	{
		"caleb",
		dir = "~/personal/caleb",
		config = function() end,
	},
	{
		"harpoon",
		dir = "~/personal/harpoon",
		config = function()
			local harpoon = require("harpoon")

			harpoon:setup()

			vim.keymap.set("n", "<leader>A", function()
				harpoon:list():prepend()
			end)
			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():add()
			end)
			vim.keymap.set("n", "<C-e>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)

			vim.keymap.set("n", "<C-h>", function()
				harpoon:list():select(1)
			end)
			vim.keymap.set("n", "<C-t>", function()
				harpoon:list():select(2)
			end)
			vim.keymap.set("n", "<C-n>", function()
				harpoon:list():select(3)
			end)
			vim.keymap.set("n", "<C-s>", function()
				harpoon:list():select(4)
			end)
			vim.keymap.set("n", "<leader><C-h>", function()
				harpoon:list():replace_at(1)
			end)
			vim.keymap.set("n", "<leader><C-t>", function()
				harpoon:list():replace_at(2)
			end)
			vim.keymap.set("n", "<leader><C-n>", function()
				harpoon:list():replace_at(3)
			end)
			vim.keymap.set("n", "<leader><C-s>", function()
				harpoon:list():replace_at(4)
			end)
		end,
	},
	{
		"vim-apm",
		dir = "~/personal/vim_apm",
		config = function() end,
	},

	{
		"vim-with-me",
		dir = "~/personal/vim-with-me",
		config = function() end,
	},
}

return local_plugins
