return {
	{
		"mhartington/formatter.nvim",
		config = function()
			-- Utilities for creating configurations

			local util = require("formatter.util")
			local clang_format = function()
				return {
					exe = "clang-format",
					args = {
						"-style=Microsoft",
						"-assume-filename",
						util.escape_path(util.get_current_buffer_file_name()),
					},
				}
			end
			-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
			require("formatter").setup({
				-- Enable or disable logging
				logging = true,
				-- Set the log level
				log_level = vim.log.levels.WARN,
				-- All formatter configurations are opt-in
				filetype = {
					-- Formatter configurations for filetype "lua" go here
					-- and will be executed in order
					lua = {
						require("formatter.filetypes.lua").stylua,
					},
					cpp = {
						clang_format,
					},
					c = {
						clang_format,
					},

					-- Use the special "*" filetype for defining formatter configurations on
					-- any filetype
					["*"] = {
						-- "formatter.filetypes.any" defines default configurations for any
						-- filetype
						require("formatter.filetypes.any").remove_trailing_whitespace,
						-- Remove trailing whitespace without 'sed'
						-- require("formatter.filetypes.any").substitute_trailing_whitespace,
					},
				},
			})
		end,
	},
}
