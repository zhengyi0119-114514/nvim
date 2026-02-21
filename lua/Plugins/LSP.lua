return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = { ensure_installed = { "lua_ls" } },
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
	},
	{
		"rmagatti/goto-preview",
		dependencies = { "rmagatti/logger.nvim" },
		event = "BufEnter",
		config = true, -- necessary as per https://github.com/rmagatti/goto-preview/issues/88
		keys = {
			{
				"<LEADER>lpD",
				"<CMD>lua require('goto-preview').goto_preview_type_definition()<CR>",
				desc = "Preview Type Definition",
			},
			{
				"<LEADER>lpi",
				"<CMD>lua require('goto-preview').goto_preview_implementation()<CR>",
				desc = "Preview Implementation",
			},
			{
				"<LEADER>lpd",
				"<CMD>lua require('goto-preview').goto_preview_definition()<CR>",
				desc = "Preview Definition",
			},
			{
				"<LEADER>lpr",
				"<CMD>lua require('goto-preview').goto_preview_references()<CR>",
				{ desc = "Preview References" },
			},
			{
				"<LEADER>lpc",
				"<CMD>lua require('goto-preview').close_all_win()<CR>",
				desc = "Close Preview Window",
			},
		},
	},
	{
		"rafamadriz/friendly-snippets",
	},
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<LEADER>lt",
				desc = "trouble",
			},
			{
				"<LEADER>ltr",
				"<CMD>Trouble lsp toggle focus=false win.position=right<CR>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<LEADER>ltD",
				"<CMD>Trouble diagnostics toggle filter.buf=0<<CR>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{ "<LEADER>lts", "<CMD>Trouble symbols toggle focus=false<CR>", desc = "Symbols (Trouble)" },
			{ "<LEADER>ltl", "<CMD>Trouble loclist toggle<CR>", desc = "Location List (Trouble)" },
			{ "<LEADER>ltd", "<CMD>Trouble diagnostics toggle<CR>", desc = "Diagnostics 诊断 (Trouble)" },
			{ "<LEADER>ltq", "<CMD>Trouble qflist toggle<CR>", desc = "Quickfix List (Trouble)" },
		},
	},
	{ "hedyhli/outline.nvim",
		opts = {},
		keys = {
			{ "<LEADER>ls", "<CMD>Outline<CR>", desc = "Toggle Outline" },
		},
	},
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				markdown = { "markdownlint-cli2" },
			}
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					-- try_lint without arguments runs the linters defined in `linters_by_ft`
					-- for the current filetype
					require("lint").try_lint()

					-- You can call `try_lint` with a linter name or a list of names to always
					-- run specific linters, independent of the `linters_by_ft` configuration
					-- require("lint").try_lint("cspell")
				end,
			})
		end,
	},
	{
		"rachartier/tiny-code-action.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "ibhagwan/fzf-lua" },
		},
		event = "LspAttach",
		opts = {},
		keys = {
			{ "<LEADER>la", "<CMD>lua require('tiny-code-action').code_action()<CR>", desc = "Code atcion" },
		},
	},
	{
		"smjonas/inc-rename.nvim",
		opts = {},
		keys = {
			{ "<F2>", ":IncRename ", desc = "Rename" },
			{ "<LEADER>lr", ":IncRename ", desc = "Rename" },
		},
	},
	{
		"Bekaboo/dropbar.nvim",
		opts = {},
	},
}
