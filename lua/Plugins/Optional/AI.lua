return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		---@type fun(param:table,param:render.md.Config)
		opts = function(_, Options)
			table.insert(Options.file_types, "codecompanion")
		end,
	},
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			-- "github/copilot.vim",
		},
		opts = {
			-- NOTE: The log_level is in `opts.opts`
			opts = {
				log_level = "DEBUG", -- or "TRACE"
			},
			language = "Chinese",
			strategies = {
				chat = { adapter = "deepseek" },
				inline = { adapter = "deepseek" },
				agent = { adapter = "deepseek" },
			},
		},
		keys = {
			{ "<LEADER>a", desc = "AI" },
			{ "<LEADER>ac", "<CMD>CodeCompanionChat<CR>", desc = "AI Chat" },
			{ "<LEADER>aa", "<CMD>CodeCompanionActions<CR>", desc = "AI Actions" },
		},
	},
	{
		"saghen/blink.cmp",
		optional = true,
		---@type fun(param:table,param:blink.cmp.Config)
		opts = function(_, Options)
			table.insert(Options.sources.default, "codecompanion")
			Options.sources.providers.codecompanion = {
				name = "CodeCompanion",
				module = "codecompanion.providers.completion.blink",
			}
		end,
	},
}
