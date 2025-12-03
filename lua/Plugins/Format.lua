return {
	{
		-- https://github.com/stevearc/conform.nvim
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					rust = { "rustfmt", lsp_format = "fallback" },
					cpp = { "clang_format" },
					c = { "clang_format" },
					-- cs = { "clang_format" },
					cs = { "csharpier" },
				},
			})
			require("conform").formatters.clang_format = {
				command = "clang-format",
				args = { "-assume-filename", "$FILENAME", "--sytle=Microsoft" },
			}
		end,
	},
}
