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
	-- top
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		opts = {
			-- configurations go here
		},
	},
	{
		"Xuyuanp/scrollbar.nvim",
	},
	{
		--theme
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			--local dashboard = require("alpha.themes.dashboard")
			--local startify = require("alpha.themes.startify")
			local mytheme = require("plu.alpha.alpha-theme")
			-- available: devicons, mini, default is mini
			-- if provider not loaded and enabled is true, it will try to use another provider
			--startify.file_icons.provider = "devicons"
			require("alpha").setup(mytheme.config)
		end,
	},
	--nvim tree
	{
		"nvim-tree/nvim-tree.lua",
		version = "v1.5",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({})
		end,
	},
	--treesetter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	"hiphish/rainbow-delimiters.nvim",
	{
		"romgrk/nvim-treesitter-context",
		lazy = true,
		event = { "User FileOpened" },
		config = function()
			require("treesitter-context").setup({
				enable = true,
				throttle = true,
				max_lines = 0,
				patterns = {
					default = {
						"class",
						"function",
						"method",
					},
				},
			})
		end,
	},
	"JoosepAlviste/nvim-ts-context-commentstring",
	-- top tab
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
	},

	-- information
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	--search
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
	},

	-- jump
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

	-- NOET: lsp

	"neovim/nvim-lspconfig",

	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-nvim-lsp",

	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",

	"nvimdev/lspsaga.nvim",
	{
		"onsails/lspkind.nvim",
		event = { "VimEnter" },
	},
	{
		"smjonas/inc-rename.nvim",
	},

	--dap
	{
		"mfussenegger/nvim-dap",
		version = "0.8.0",
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
	},
	"theHamsta/nvim-dap-virtual-text",
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},

	--mason
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"jay-babu/mason-nvim-dap.nvim",

	--git
	"sindrets/diffview.nvim",
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			"nvim-telescope/telescope.nvim", -- optional
		},
		config = true,
	},
	--terminal
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = true,
	},
	{
		"numToStr/Navigator.nvim",
		config = function()
			require("Navigator").setup({
				-- Save modified buffer(s) when moving to mux
				-- nil - Don't save (default)
				-- 'current' - Only save the current modified buffer
				-- 'all' - Save all the buffers
				auto_save = nil,

				-- Disable navigation when the current mux pane is zoomed in
				disable_on_zoom = false,

				-- Multiplexer to use
				-- 'auto' - Chooses mux based on priority (default)
				-- table - Custom mux to use
				mux = "auto",
			})
		end,
	},
	{
		"roobert/bufferline-cycle-windowless.nvim",
		dependencies = {
			{ "akinsho/bufferline.nvim" },
		},
		config = function()
			require("bufferline-cycle-windowless").setup({
				-- whether to start in enabled or disabled mode
				default_enabled = true,
			})
		end,
	},
	-- tasks
	"stevearc/overseer.nvim",
	"Civitasv/cmake-tools.nvim",

	"okuuva/auto-save.nvim",
	"dstein64/vim-startuptime",
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
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
	{
		"hedyhli/outline.nvim",
		config = function()
			-- Example mapping to toggle outline
			vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

			require("outline").setup({
				-- Your setup opts here (leave empty to use defaults)
			})
		end,
	},
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
	},
	"mhartington/formatter.nvim",

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	-- project
	"LintaoAmons/cd-project.nvim",
})
