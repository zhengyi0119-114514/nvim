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
		-- add your plugins here

		-- theme :https://github.com/catppuccin/nvim
		{
			"catppuccin/nvim",
			name = "catppuccin",
			priority = 1000,
		},
		{
			"goolord/alpha-nvim",
			dependencies = {
				"echasnovski/mini.icons",
				"nvim-lua/plenary.nvim",
			},
		},

		-- tab and buffer
		{
			"akinsho/bufferline.nvim",
            keys = {
                "<leader>et","<cmd>NvimTreeToggle<cr>",desc ="Toggle file explorer",
            },
			version = "*",
			dependencies = "nvim-tree/nvim-web-devicons",
		},
		{
			"nvim-lualine/lualine.nvim",
			dependencies = "nvim-tree/nvim-web-devicons",
		},
		-- UI
		-- lazy.nvim
		{
			"folke/noice.nvim",
			event = "VeryLazy",
			dependencies = {
				"MunifTanjim/nui.nvim",
				"rcarriga/nvim-notify",
			},
		},
		-- TreeSetter
		{
			lazy = true,
			"nvim-treesitter/nvim-treesitter",
			config = function()
				require("plugins.TreeSetter.nvim-treesetter")
			end,
		},
		{
			"nvim-treesitter/nvim-treesitter-context",
			lazy = true,
			config = function()
				require("plugins.TreeSetter.nvim-treesetter-context")
			end,
			dependencies = {
				"nvim-treesitter/nvim-treesitter",
			},
		},
		{
			"HiPhish/rainbow-delimiters.nvim",
			lazy = true,
			config = function()
				require("plugins.TreeSetter.rainbow-delimiters")
			end,
			dependencies = {
				"nvim-treesitter/nvim-treesitter",
			},
		},
		{
			"JoosepAlviste/nvim-ts-context-commentstring",
			lazy = true,
			config = function()
				require("plugins.TreeSetter.nvim-treesetter-context")
			end,
			dependencies = {
				"nvim-treesitter/nvim-treesitter",
			},
		},
		-- Explorer
		"nvim-tree/nvim-tree.lua",
		"klen/nvim-config-local",
		-- KeyMap
		{
			"folke/which-key.nvim",
			event = "VeryLazy",
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
		{
			"christoomey/vim-tmux-navigator",
			cmd = {
				"TmuxNavigateLeft",
				"TmuxNavigateDown",
				"TmuxNavigateUp",
				"TmuxNavigateRight",
				"TmuxNavigatePrevious",
			},
			keys = {
				{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
				{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
				{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
				{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
				{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
			},
		},
		-- LanguageServerProtocol
		"neovim/nvim-lspconfig",

		{
			"L3MON4D3/LuaSnip",
			lazy = true,
			config = function()
				require("plugins.LanguageServeProtocol.Snips.Luasnip")
			end,
		},
		{
			"rafamadriz/friendly-snippets",
			lazy = true,
			event = "InsertEnter",
			dependencies = {
				"L3MON4D3/LuaSnip",
			},
		},
		{
			"hrsh7th/nvim-cmp",
			lazy = true,
			event = "InsertEnter",
			config = function()
				require("plugins.LanguageServeProtocol.CMP")
			end,
			dependencies = {
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-cmdline",
				"L3MON4D3/LuaSnip",
				"saadparwaiz1/cmp_luasnip",
			},
		},
		{
			"onsails/lspkind.nvim",
			lazy = true,
			event = "InsertEnter",
            config = function ()
                require("plugins.LanguageServeProtocol.lspkind-nvim")
            end,
			dependencies = {
				"hrsh7th/nvim-cmp",
			},
		},
		"smjonas/inc-rename.nvim",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		{
			"nvimdev/lspsaga.nvim",
            config = function ()
                require("plugins.LanguageServeProtocol.lspsaga")
            end,
			dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		},

		--Debug
		{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
		"theHamsta/nvim-dap-virtual-text",

		-- Formatter
		"mhartington/formatter.nvim",

		--Scrollbar
		"lewis6991/satellite.nvim",

		--Edit
		{ "windwp/nvim-autopairs", event = "InsertEnter", config = true, lazy = true },
		{
			"Pocco81/auto-save.nvim",
			config = function()
				require("auto-save").setup()
			end,
		},
		{ "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
		{
			"lukas-reineke/indent-blankline.nvim",
			main = "ibl",
			config = function()
				require("ibl").setup()
			end,
		},
		{ "nvim-telescope/telescope.nvim", tag = "0.1.8", dependencies = { "nvim-lua/plenary.nvim" } },
		{
			"luukvbaal/statuscol.nvim",
			config = function()
				require("statuscol").setup()
			end,
		},

		-- Git
		{
			"NeogitOrg/neogit",
			dependencies = {
				"nvim-lua/plenary.nvim", -- required
				"sindrets/diffview.nvim", -- optional - Diff integration
				"nvim-telescope/telescope.nvim", -- optional
			},
			config = function()
				require("neogit").setup()
			end,
		},
		{
			"sontungexpt/better-diagnostic-virtual-text",
			event = "LspAttach",
			config = function(_)
				require("better-diagnostic-virtual-text").setup()
			end,
		},
	},
	-- automatically check for plugin updates
	checker = { enabled = false },
})
