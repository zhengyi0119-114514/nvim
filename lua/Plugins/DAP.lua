return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"jbyuki/one-small-step-for-vimkind",
		},
	},
	{
		"nvim-telescope/telescope-dap.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"mfussenegger/nvim-dap",
		},
		config = function()
			require("telescope").load_extension("dap")
		end,
	},
	-- {
	-- 	"rcarriga/nvim-dap-ui",
	-- 	dependencies = {
	-- 		"mfussenegger/nvim-dap",
	-- 		"nvim-neotest/nvim-nio",
	-- 	},
	-- 	config = function()
	-- 		require("dapui").setup()
	-- 		local dap, dapui = require("dap"), require("dapui")
	-- 		dap.listeners.before.attach.dapui_config = function()
	-- 			dapui.open()
	-- 		end
	-- 		dap.listeners.before.launch.dapui_config = function()
	-- 			dapui.open()
	-- 		end
	-- 		dap.listeners.before.event_terminated.dapui_config = function()
	-- 			dapui.close()
	-- 		end
	-- 		dap.listeners.before.event_exited.dapui_config = function()
	-- 			dapui.close()
	-- 		end
	-- 	end,
	-- },
	{
		"igorlfs/nvim-dap-view",
		---@module 'dap-view'
		---@type dapview.Config
		opts = {
            auto_toggle = true,
        },
	},
	-- virtual text for the debugger
	{
		"theHamsta/nvim-dap-virtual-text",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		opts = {},
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = "mason.nvim",
		cmd = { "DapInstall", "DapUninstall" },
		opts = {
			-- Makes a best effort to setup the various debuggers with
			-- reasonable debug configurations
			automatic_installation = true,

			-- You can provide additional configuration to the handlers,
			-- see mason-nvim-dap README for more information
			handlers = {},

			-- You'll need to check that you have the required things installed
			-- online, please don't ask me how to install them :)
			ensure_installed = {
				"codelldb"
			},
		},
		-- mason-nvim-dap is loaded when nvim-dap loads
		config = function() end,
	},
}
