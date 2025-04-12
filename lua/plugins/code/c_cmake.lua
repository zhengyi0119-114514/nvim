return {
	{
		"Civitasv/cmake-tools.nvim",
		lazy = true,
		init = function()
			local loaded = false
			local function check()
				local cwd = vim.uv.cwd()
				if vim.fn.filereadable(cwd .. "/CMakeLists.txt") == 1 then
					require("lazy").load({ plugins = { "cmake-tools.nvim" } })
					loaded = true
				end
			end
			check()
			vim.api.nvim_create_autocmd("DirChanged", {
				callback = function()
					if not loaded then
						check()
					end
				end,
			})
		end,
		config = function()
			local osys = require("cmake-tools.osys")
			require("cmake-tools").setup({
				cmake_command = "cmake", -- this is used to specify cmake command path
				ctest_command = "ctest", -- this is used to specify ctest command path
				cmake_use_preset = true,
				cmake_regenerate_on_save = false, -- auto generate when save CMakeLists.txt
				cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" }, -- this will be passed when invoke `CMakeGenerate`
				-- cmake_build_options = {}, -- this will be passed when invoke `CMakeBuild`
				-- -- support macro expansion:
				-- --       ${kit}
				-- --       ${kitGenerator}
				-- --       ${variant:xx}
				cmake_build_directory = function()
					return "build"
				end, -- this is used to specify generate directory for cmake, allows macro expansion, can be a string or a function returning the string, relative to cwd.
				cmake_soft_link_compile_commands = true, -- this will automatically make a soft link from compile commands file to project root dir
				cmake_compile_commands_from_lsp = false, -- this will automatically set compile commands file location using lsp, to use it, please set `cmake_soft_link_compile_commands` to false
				-- cmake_kits_path = nil, -- this is used to specify global cmake kits path, see CMakeKits for detailed usage
				-- cmake_variants_message = {
				-- 	short = { show = true }, -- whether to show short message
				-- 	long = { show = true, max_length = 40 }, -- whether to show long message
				-- },
				cmake_executor = { -- executor to use
					name = "quickfix", -- name of the executor
					opts = {}, -- the options the executor will get, possible values depend on the executor type. See `default_opts` for possible values.
					default_opts = { -- a list of default and possible values for executors
						toggleterm = {
							direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
							close_on_exit = false, -- whether close the terminal when exit
							auto_scroll = true, -- whether auto scroll to the bottom
							singleton = true, -- single instance, autocloses the opened one, if present
						},
						overseer = {
							new_task_opts = {
								strategy = {
									"toggleterm",
									direction = "horizontal",
									auto_scroll = true,
									quit_on_exit = "success",
								},
							}, -- options to pass into the `overseer.new_task` command
							on_new_task = function(task)
								require("overseer").open({ enter = false, direction = "right" })
							end, -- a function that gets overseer.Task when it is created, before calling `task:start`
						},
						terminal = {
							name = "Main Terminal",
							prefix_name = "[CMakeTools]: ", -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name
							split_direction = "horizontal", -- "horizontal", "vertical"
							split_size = 11,

							-- Window handling
							single_terminal_per_instance = true, -- Single viewport, multiple windows
							single_terminal_per_tab = true, -- Single viewport per tab
							keep_terminal_static_location = true, -- Static location of the viewport if avialable
							auto_resize = true, -- Resize the terminal if it already exists

							-- Running Tasks
							start_insert = false, -- If you want to enter terminal with :startinsert upon using :CMakeRun
							focus = false, -- Focus on terminal when cmake task is launched.
							do_not_add_newline = false, -- Do not hit enter on the command inserted when using :CMakeRun, allowing a chance to review or modify the command before hitting enter.
						}, -- terminal executor uses the values in cmake_terminal
					},
				},
				cmake_runner = { -- runner to use
					name = "terminal", -- name of the runner
					opts = {}, -- the options the runner will get, possible values depend on the runner type. See `default_opts` for possible values.
					default_opts = { -- a list of default and possible values for runners
						quickfix = {
							show = "always", -- "always", "only_on_error"
							position = "belowright", -- "bottom", "top"
							size = 10,
							encoding = "utf-8",
							auto_close_when_success = true, -- typically, you can use it with the "always" option; it will auto-close the quickfix buffer if the execution is successful.
						},
						toggleterm = {
							direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
							close_on_exit = false, -- whether close the terminal when exit
							auto_scroll = true, -- whether auto scroll to the bottom
							singleton = true, -- single instance, autocloses the opened one, if present
						},
						overseer = {
							new_task_opts = {
								strategy = {
									"toggleterm",
									direction = "horizontal",
									autos_croll = true,
									quit_on_exit = "success",
								},
							}, -- options to pass into the `overseer.new_task` command
							on_new_task = function(task) end, -- a function that gets overseer.Task when it is created, before calling `task:start`
						},
						terminal = {
							name = "Main Terminal",
							prefix_name = "[CMakeTools]: ", -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name
							split_direction = "horizontal", -- "horizontal", "vertical"
							split_size = 11,

							-- Window handling
							single_terminal_per_instance = true, -- Single viewport, multiple windows
							single_terminal_per_tab = true, -- Single viewport per tab
							keep_terminal_static_location = true, -- Static location of the viewport if avialable
							auto_resize = true, -- Resize the terminal if it already exists

							-- Running Tasks
							start_insert = false, -- If you want to enter terminal with :startinsert upon using :CMakeRun
							focus = false, -- Focus on terminal when cmake task is launched.
							do_not_add_newline = false, -- Do not hit enter on the command inserted when using :CMakeRun, allowing a chance to review or modify the command before hitting enter.
						},
					},
				},
				cmake_notifications = {
					runner = { enabled = true },
					executor = { enabled = true },
					spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }, -- icons used for progress display
					refresh_rate_ms = 100, -- how often to iterate icons
				},
				cmake_virtual_text_support = true, -- Show the target related to current file using virtual text (at right corner)
			})
		end,
	},
	{
		"p00f/clangd_extensions.nvim",
		opts = {
			ast = {
				-- -- These are unicode, should be available in any font
				-- role_icons = {
				-- 	type = "🄣",
				-- 	declaration = "🄓",
				-- 	expression = "🄔",
				-- 	statement = ";",
				-- 	specifier = "🄢",
				-- 	["template argument"] = "🆃",
				-- },
				-- kind_icons = {
				-- 	Compound = "🄲",
				-- 	Recovery = "🅁",
				-- 	TranslationUnit = "🅄",
				-- 	PackExpansion = "🄿",
				-- 	TemplateTypeParm = "🅃",
				-- 	TemplateTemplateParm = "🅃",
				-- 	TemplateParamObject = "🅃",
				-- },
				--These require codicons (https://github.com/microsoft/vscode-codicons)
				role_icons = {
					type = "",
					declaration = "",
					expression = "",
					specifier = "",
					statement = "",
					["template argument"] = "",
				},

				kind_icons = {
					Compound = "",
					Recovery = "",
					TranslationUnit = "",
					PackExpansion = "",
					TemplateTypeParm = "",
					TemplateTemplateParm = "",
					TemplateParamObject = "",
				},

				highlights = {
					detail = "Comment",
				},
			},
			memory_usage = {
				border = "none",
			},
			symbol_info = {
				border = "none",
			},
		},
	},
	{
		"hrsh7th/nvim-cmp",
        dependencies = {
            "formatter.nvim"
        },
		optional = true,
		opts = function(_, opts)
			opts.sorting = opts.sorting or {}
			opts.sorting.comparators = opts.sorting.comparators or {}
			table.insert(opts.sorting.comparators, 1, require("clangd_extensions.cmp_scores"))
		end,
	},
}
