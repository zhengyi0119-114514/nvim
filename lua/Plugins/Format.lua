return {
	-- {
	-- 	-- https://github.com/mhartington/formatter.nvim
	-- 	"mhartington/formatter.nvim",
	-- 	config = function()
	-- 		-- Utilities for creating configurations
	-- 		local util = require("formatter.util")
	--
	-- 		-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
	-- 		require("formatter").setup({
	-- 			-- Enable or disable logging
	-- 			logging = true,
	-- 			-- Set the log level
	-- 			log_level = vim.log.levels.WARN,
	-- 			-- All formatter configurations are opt-in
	-- 			filetype = {
	-- 				-- Formatter configurations for filetype "lua" go here
	-- 				-- and will be executed in order
	-- 				lua = {
	-- 					-- "formatter.filetypes.lua" defines default configurations for the
	-- 					-- "lua" filetype
	-- 					require("formatter.filetypes.lua").stylua,
	--
	-- 					-- -- You can also define your own configuration
	-- 					-- function()
	-- 					--   -- Supports conditional formatting
	-- 					--   if util.get_current_buffer_file_name() == "special.lua" then
	-- 					--     return nil
	-- 					--   end
	-- 					--
	-- 					--   -- Full specification of configurations is down below and in Vim help
	-- 					--   -- files
	-- 					--   return {
	-- 					--     exe = "stylua",
	-- 					--     args = {
	-- 					--       "--search-parent-directories",
	-- 					--       "--stdin-filepath",
	-- 					--       util.escape_path(util.get_current_buffer_file_path()),
	-- 					--       "--",
	-- 					--       "-",
	-- 					--     },
	-- 					--     stdin = true,
	-- 					--   }
	-- 					-- end
	-- 				},
	-- 				c = {
	-- 					function()
	-- 						return {
	-- 							exe = "clang-format",
	-- 							args = {
	-- 								"-assume-filename",
	-- 								util.escape_path(util.get_current_buffer_file_name()),
	-- 								"-sytle=Microsoft", -- Microsoft sytle
	-- 							},
	-- 							stdin = true,
	-- 						}
	-- 					end,
	-- 				},
	-- 				["*"] = {
	-- 					require("formatter.filetypes.any").remove_trailing_whitespace,
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- },
	{
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
