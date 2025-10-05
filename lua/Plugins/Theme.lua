return {
	{
        -- https://github.com/catppuccin/nvim
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			treesitter_context = true,
			rainbow_delimiters = true,
			treesitter = true,
			neotree = true,
			mason = true,
			noice = true,
			cmp = true,
			notify = true,
			render_markdown = true,
			gitgraph = true,
			diffview = true,
			dropbar = {
				enabled = false,
				color_mode = false, -- enable color for kind's texts, not just kind's icons
			},
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
					ok = { "italic" },
				},
				underlines = {
					errors = { "underline" },
					hints = { "underline" },
					warnings = { "underline" },
					information = { "underline" },
					ok = { "underline" },
				},
				inlay_hints = {
					background = true,
				},
			},
		},
	},
}
