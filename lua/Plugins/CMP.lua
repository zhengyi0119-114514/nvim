return {
	{
		"saghen/blink.cmp",
		-- optional: provides snippets for the snippet source
		dependencies = {
			"rafamadriz/friendly-snippets",
			{
				"saghen/blink.compat",
				version = "2.*",
				lazy = true,
				opts = {},
			},
		},

		-- use a release tag to download pre-built binaries
		version = "1.*",
		-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = "none",
				["<A-k>"] = { "select_prev", "fallback" },
				["<A-j>"] = { "select_next", "fallback" },
				["<UP>"] = { "select_prev", "fallback" },
				["<DOWN>"] = { "select_next", "fallback" },
				["<TAB>"] = { "accept", "snippet_forward", "fallback" },
				["<S-TAB>"] = { "snippet_backward", "fallback" },
				["<ESC>"] = { "fallback" },
				["<A-u>"] = { "scroll_documentation_down", "fallback" },
				["<A-i>"] = { "scroll_documentation_up", "fallback" },
			},
			appearance = {
				-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			},

			-- (Default) Only show the documentation popup when manually triggered
			completion = {
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 50,
				},
				trigger = {
					show_on_keyword = true,
				},
				ghost_text = {
					enabled = true,
				},
				menu = {
					enabled = true,
					min_width = 20,
					max_height = 20,
					border = "rounded",
					scrollbar = true,
				},
			},

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				providers = {},
			},

			-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
			-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
			-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
			--
			-- See the fuzzy documentation for more information
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
	-- -- CMP 自动补全
	-- {
	-- 	"hrsh7th/nvim-cmp",
	-- 	dependencies = {
	-- 		"neovim/nvim-lspconfig",
	-- 		"hrsh7th/cmp-nvim-lsp",
	-- 		"hrsh7th/cmp-buffer",
	-- 		"hrsh7th/cmp-path",
	-- 		"hrsh7th/cmp-cmdline",
	-- 		"onsails/lspkind.nvim",
	-- 		"rafamadriz/friendly-snippets",
	-- 	},
	-- 	config = function()
	-- 		-- Set up nvim-cmp.
	--            vim.lsp.config("*",{capabilities = require("cmp_nvim_lsp").default_capabilities()})
	-- 		local cmp = require("cmp")
	-- 		local lspkind = require("lspkind")
	-- 		cmp.setup({
	-- 			snippet = {
	-- 				-- REQUIRED - you must specify a snippet engine
	-- 				expand = function(args)
	-- 					vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
	-- 				end,
	-- 			},
	-- 			window = {
	-- 				-- completion = cmp.config.window.bordered(),
	-- 				documentation = cmp.config.window.bordered(),
	-- 			},
	-- 			mapping = cmp.mapping.preset.insert({
	-- 				["<C-[>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
	-- 				["<C-]>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
	-- 				["<A-k>"] = cmp.mapping.select_prev_item(),
	-- 				["<A-j>"] = cmp.mapping.select_next_item(),
	-- 				["<TAB>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
	-- 			}),
	-- 			sources = cmp.config.sources({
	-- 				{ name = "nvim_lsp" },
	-- 				{ name = "snippets" },
	-- 				{ name = "path" },
	-- 			}, {
	-- 				{ name = "buffer" },
	-- 			}),
	-- 			formatting = {
	-- 				format = lspkind.cmp_format({
	-- 					mode = "symbol", -- show only symbol annotations
	-- 					maxwidth = {
	-- 						-- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
	-- 						-- can also be a function to dynamically calculate max width such as
	-- 						-- menu = function() return math.floor(0.45 * vim.o.columns) end,
	-- 						menu = 50, -- leading text (labelDetails)
	-- 						abbr = 50, -- actual suggestion item
	-- 					},
	-- 					ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
	-- 					show_labelDetails = true, -- show labelDetails in menu. Disabled by default
	--
	-- 					-- The function below will be called before any actual modifications from lspkind
	-- 					-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
	-- 					before = function(entry, vim_item)
	-- 						-- ...
	-- 						return vim_item
	-- 					end,
	-- 				}),
	-- 			},
	-- 		})
	-- 		cmp.setup.cmdline(":", {
	-- 			mapping = cmp.mapping.preset.cmdline(),
	-- 			sources = cmp.config.sources({
	-- 				{ name = "path" },
	-- 			}, {
	-- 				{
	-- 					name = "cmdline",
	-- 				},
	-- 			}),
	-- 		})
	-- 		-- Set up lspconfig.
	-- 	end,
	-- },
}
