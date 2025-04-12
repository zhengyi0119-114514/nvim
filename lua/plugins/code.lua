return {
	{
		"stevearc/overseer.nvim",
		opts = {},
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		optional = true,
		opts = function(_, opts)
			opts = opts or {}
			opts.consumers = opts.consumers or {}
			opts.consumers.overseer = require("neotest.consumers.overseer")
		end,
	},
}
