return { -- lazy.nvim
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
	},
	{
		"folke/edgy.nvim",
		event = "VeryLazy",
		opts = {
			left = { "neo-tree" },
			bottom = { "toggleterm" },
			right = { "trouble","Outline" },
			top = {},
			options = {
				left = { size = 40 },
				bottom = { size = 15 },
				right = { size = 40 },
				top = { size = 10 },
			},
		},
	},
}
