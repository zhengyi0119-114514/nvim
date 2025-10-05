return {
	{
		"danymat/neogen",
		opts = {},
		keys = {
			{
				"<LEADER>ed",
				function()
					require("neogen").generate()
				end,
				desc = "Generate Annotations (Neogen)",
			},
		},
	},
}
