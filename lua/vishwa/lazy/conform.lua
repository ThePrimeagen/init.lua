return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "gofmt" },
				javascript = { "prettierd" },
				css = { "prettierd" },
				scss = { "prettierd" },
				jsx = { "prettierd" },
				html = { "prettierd" },
				java = { "clang-format" },
				python = { "black" },
				c = { "clang-format" },
				rust = { "rustfmt" },
				asm = { "asmfmt" },
				cpp = { "clang-format" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				json = { "prettier" },
			},
		})
	end,
}
