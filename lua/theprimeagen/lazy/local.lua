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

        end,
	},
	{
		"the-stru",
		dir = "~/personal/the-stru",
	},
}

return local_plugins
