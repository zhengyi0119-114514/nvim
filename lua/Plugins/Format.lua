return {
	{
		-- https://github.com/stevearc/conform.nvim
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					rust = { "rustfmt", lsp_format = "fallback" },
					cpp = { "clang-format" },
					c = { "clang-format" },
				},
			})
			require("conform").formatters.clang_format = {
				command = "clang-format",
				args = { "-assume-filename", "$FILENAME", "--sytle=Microsoft" },
			}
		end,
	},
}
