return { -- lazy.nvim
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			presets = { inc_rename = true },
		},
		dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
	},
	{
		"folke/edgy.nvim",
		event = "VeryLazy",
		opts = {
			left = { "neo-tree" },
			bottom = { "toggleterm", "trouble" },
			right = { "Outline" },
			top = {},
			---@type table<Edgy.Pos, {size:integer | fun():integer, wo?:vim.wo}>
			options = {
				left = { size = 40 },
				bottom = { size = 15 },
				right = { size = 40 },
				top = { size = 10 },
			},
		},
	},
}
