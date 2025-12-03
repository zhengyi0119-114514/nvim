return {
	{
		"GustavEikaas/easy-dotnet.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"ibhagwan/fzf-lua",
		},
        build = "dotnet tool install -g EasyDotnet",
		opts = {
			lsp = {
				enable = true,
			},
			debugger = {
				-- The path to netcoredbg executable
				bin_path = "netcoredbg",
				auto_register_dap = true,
			},
			picker = "fzf",
		},
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		optional = true,
		opts = function(_, Options)
			Options.filesystem.window.mappings[";"] = "dotnet"
			Options.filesystem.commands["dotnet"] = function(state)
				local node = state.tree:get_node()
				local path = node.type == "directory" and node.path or vim.fs.dirname(node.path)
				require("easy-dotnet").create_new_item(path, function()
					require("neo-tree.sources.manager").refresh(state.name)
				end)
			end
		end,
	},
}
