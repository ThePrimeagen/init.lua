--[[
return {
	"copilotlsp-nvim/copilot-lsp",
	init = function()
		vim.g.copilot_nes_debounce = 500
		vim.lsp.enable("copilot")
		vim.keymap.set("n", "<tab>", function()
			require("copilot-lsp.nes").apply_pending_nes()
		end)
	end,
}
--]]
