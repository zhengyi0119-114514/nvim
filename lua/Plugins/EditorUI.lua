return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				theme = "catppuccin",
			},
		},
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		lazy = false,
		opts = {
			sources = { "filesystem", "buffers", "git_status", "document_symbols" },
			open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
			filesystem = {
				window = {
					mappings = {},
				},
				commands = {},
				follow_current_file = { enabled = true },
				use_libuv_file_watcher = true,
			},
		},
		keys = {
			{ "<LEADER>et", "<CMD>Neotree toggle<CR>", desc = "File Explorer" },
			{ "<C-A-e>", "<CMD>Neotree toggle<CR>", desc = "File Explorer" },
			{ "<LEADER>eo", "<CMD>Neotree<CR>", desc = "File Explorer" },
		},
	},
	-- {
	-- 	"lukas-reineke/indent-blankline.nvim",
	-- 	main = "ibl",
	-- 	opts = {},
	-- },
	{
		"saghen/blink.indent",
		--- @module 'blink.indent'
		--- @type blink.indent.Config
		-- opts = {},
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		lazy = false,
		opts = {
			highlights = require("catppuccin.special.bufferline").get_theme(),
			options = {
				tab_size = 13,
				custom_filter = function(bufferNumber, bufferNumbers)
                    if vim.bo[bufferNumber].filetype == "help" then
                        return false
                    elseif vim.bo[bufferNumber].filetype == "checkhealth" then
                        return false
                    elseif vim.bo[bufferNumber].filetype == "grug-far" then
                        return false
                    end
                    return true
				end,

				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						text_align = "center",
						separator = true,
					},
					{
						filetype = "Outline",
						text = "Symbol Explorer",
						text_align = "center",
						separator = true,
					},
					{
						filetype = "grug-far",
						text = "Find and replace",
						text_align = "center",
						separator = true,
					},
				},
				numbers = function(opts)
					return string.format("%s.%s", opts.lower(opts.id), opts.lower(opts.ordinal))
				end,
			},
			separator_style = "thick",
		},
		keys = {
			{ "<LEADER>b", desc = "Buffer" },
			{ "<A-h>", "<CMD>BufferLineCyclePrev<CR>" },
			{ "<A-l>", "<CMD>BufferLineCycleNext<CR>" },
			{ "<A-H>", "<CMD>BufferLineMovePrev<CR>" },
			{ "<A-L>", "<CMD>BufferLineMoveNext<CR>" },
			{ "<LEADER>bd", "<CMD>bdelete %<CR>", desc = "Delete Current Buffer" },
			{ "<LEADER>bs", "<CMD>BufferLineCloseLeft<CR>", desc = "Close Left Buffer" },
			{ "<LEADER>bf", "<CMD>BufferLineCloseRight<CR>", desc = "Close Right Buffer" },
		},
	},
	{
		"MagicDuck/grug-far.nvim",
		opts = {
			headerMaxWidth = 80,
		},
		keys = {
			{ "<LEADER>fr", "<CMD>GrugFar<CR>", desc = "Find and replace" },
			{ "<LEADER>f", desc = "Find" },
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
}
