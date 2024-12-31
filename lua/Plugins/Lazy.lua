-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- theme
		{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
		-- editor
		{
			"nvim-tree/nvim-tree.lua",
			version = "*",
			lazy = false,
			dependencies = {
				"nvim-tree/nvim-web-devicons",
			},
		},
		{
			"christoomey/vim-tmux-navigator",
			cmd = {
				"TmuxNavigateLeft",
				"TmuxNavigateDown",
				"TmuxNavigateUp",
				"TmuxNavigateRight",
				"TmuxNavigatePrevious",
				"TmuxNavigatorProcessList",
			},
			keys = {
				{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
				{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
				{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
				{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			},
		},
		{
			"windwp/nvim-autopairs",
		},
		{
			"lukas-reineke/indent-blankline.nvim",
			config = function()
				require("ibl").setup()
			end,
		},
		{
			"nvim-lualine/lualine.nvim",
			dependencies = { "nvim-tree/nvim-web-devicons" },
		},
		{
			"akinsho/bufferline.nvim",
			version = "*",
			dependencies = "nvim-tree/nvim-web-devicons",
		}, -- lazy.nvim
		{
			"folke/noice.nvim",
			event = "VeryLazy",
			dependencies = {
				"MunifTanjim/nui.nvim",
				"rcarriga/nvim-notify",
			},
		},

		--lsp
		{
			"williamboman/mason.nvim",
			dependencies = {
				"williamboman/mason-lspconfig.nvim",
				"neovim/nvim-lspconfig",
			},
		},
		{
			"hrsh7th/nvim-cmp",
			dependencies = {
				"neovim/nvim-lspconfig",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-cmdline",
				"L3MON4D3/LuaSnip",
				"saadparwaiz1/cmp_luasnip",
				"onsails/lspkind.nvim",
			},
		},
		-- treesetter
		{
			"nvim-treesitter/nvim-treesitter",
		},
		{
			"HiPhish/rainbow-delimiters.nvim",
			dependencies = {
				"nvim-treesitter/nvim-treesitter",
			},
		},
		-- comments
		{
			"folke/todo-comments.nvim",
			dependencies = { "nvim-lua/plenary.nvim" },
			config = function()
				require("todo-comments").setup()
			end,
		},
		{
			"JoosepAlviste/nvim-ts-context-commentstring",
			config = function()
				require("ts_context_commentstring").setup({ enable_autocmd = false })
			end,
		},
		--format
		{
			"mhartington/formatter.nvim",
		},
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})
