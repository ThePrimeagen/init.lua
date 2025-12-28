local local_plugins = {
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
		"99",
		dir = "~/personal/99",
		config = function()
			local _99 = require("99")
            local cwd = vim.uv.cwd()
            local basename = vim.fs.basename(cwd)
			_99.setup({
				logger = {
					level = _99.DEBUG,
					path = "/tmp/" .. basename .. ".99.debug",
					print_on_error = true,
				},
				md_files = {
					"AGENT.md",
				},
			})
			vim.keymap.set("n", "<leader>9f", function()
				_99.fill_in_function()
			end)
			vim.keymap.set("n", "<leader>9i", function()
				_99.implement_fn()
			end)
			vim.keymap.set("v", "<leader>9v", function()
				_99.implement_fn()
			end)
		end,
	},
	{
		"the-stru",
		dir = "~/personal/the-stru",
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

			vim.keymap.set("n", "<M-1>", function()
				harpoon:list():select(1)
			end)
			vim.keymap.set("n", "<M-2>", function()
				harpoon:list():select(2)
			end)
			vim.keymap.set("n", "<M-3>", function()
				harpoon:list():select(3)
			end)
			vim.keymap.set("n", "<M-4>", function()
				harpoon:list():select(4)
			end)
		end,
	},
}

return local_plugins
