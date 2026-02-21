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
			lsp_trouble = true,
			grug_far = false,
			-- cmp = true,
            blink_indent = true,
			blink_cmp = {
				style = "bordered",
			},
			fzf = true,
			notify = true,
			render_markdown = true,
			gitgraph = true,
			diffview = true,
			dropbar = {
				enabled = true,
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
	{
		"goolord/alpha-nvim",
		config = function()
			local dashboard = require("alpha.themes.dashboard")

			dashboard.section.header.val = {
				"",
				"▗▖  ▗▖▗▄▄▄▖ ▗▄▖     ▗▖  ▗▖▗▄▄▄▖▗▖  ▗▖",
				"▐▛▚▖▐▌▐▌   ▐▌ ▐▌    ▐▌  ▐▌  █  ▐▛▚▞▜▌",
				"▐▌ ▝▜▌▐▛▀▀▘▐▌ ▐▌    ▐▌  ▐▌  █  ▐▌  ▐▌",
				"▐▌  ▐▌▐▙▄▄▖▝▚▄▞▘     ▝▚▞▘ ▗▄█▄▖▐▌  ▐▌",
				"                                     ",
			}
			dashboard.section.buttons.val = {
				dashboard.button("n", "  > New file", ":enew<CR>"),
				dashboard.button("f", "󰈞  > Find file", ":FzfLua files<CR>"),
				dashboard.button("r", "  > Recent", ":FzfLua oldfiles<CR>"),
				dashboard.button("p", "󰏓  > Mason Package Manager", ":Mason<CR>"),
				dashboard.button("l", "  > Plugins Manager", ":Lazy<CR>"),
				dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | Neotree |pwd<CR>"),
				dashboard.button("q", "󰿅  > Quit NVIM", ":qa<CR>"),
			}
			require("alpha").setup(dashboard.config)
		end,
	},
}
