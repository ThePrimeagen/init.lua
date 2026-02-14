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
			_99.setup({
                show_in_flight_requests = true,
				md_files = {
					"AGENTS.md",
				},
				completion = {
					custom_rules = {
                        "~/personal/skills/skills/",
					},
					source = "cmp",
				},
                model = "openai/gpt-5.3-codex",
			})
			vim.keymap.set("n", "<leader>9s", function()
				_99.search()
			end)
			vim.keymap.set("v", "<leader>9vv", function()
				_99.visual()
			end)
			vim.keymap.set("v", "<leader>9vp", function()
				_99.visual_prompt()
			end)
			vim.keymap.set("n", "<leader>9x", function()
				_99.stop_all_requests()
			end)
			vim.keymap.set("n", "<leader>9i", function()
				_99.info()
			end)
			vim.keymap.set("n", "<leader>9l", function()
				_99.view_logs()
			end)
			vim.keymap.set("n", "<leader>9n", function()
				_99.next_request_logs()
			end)
			vim.keymap.set("n", "<leader>9p", function()
				_99.prev_request_logs()
			end)
		end,
	},
	-- {
	-- 	"the-stru",
	-- 	dir = "~/personal/the-stru",
	-- },

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
