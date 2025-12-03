local DAP = require("dap")
-- LLDB_DAP
DAP.adapters.lldb_dap = {
	type = "executable",
	command = "lldb-dap",
	name = "lldb-dap",
}
DAP.adapters.codelldb = {
	type = "executable",
	command = "codelldb",
	name = "codelldb",
}
DAP.adapters.netcoredbg = {
	type = "executable",
	command = "netcoredbg",
	name = "netcoredbg",
}
DAP.configurations.lua = {
	{
		type = "nlua",
		request = "attach",
		name = "Attach to running Neovim instance",
		cwd = "${workspaceFolder}",
	},
}
DAP.configurations.c = {
	{
		name = "codelldb-run",
		type = "codelldb",
		request = "launch",
		stopOnEntry = false,
		runInTerminal = true,
		console = "integratedTerminal",
	},
	{
		name = "codelldb-run-program",
		type = "codelldb",
		request = "launch",
		stopOnEntry = false,
		runInTerminal = true,
		console = "integratedTerminal",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
	},
	{
		name = "codelldb-attach",
		request = "attach",
		type = "codelldb",
		stopOnEntry = true,
		runInTerminal = true,
		console = "integratedTerminal",
	},
	{
		name = "lldb_dap-run",
		type = "lldb-dap",
		request = "launch",
		stopOnEntry = false,
		runInTerminal = true,
		console = "integratedTerminal",
	},
	{
		name = "lldb_dap-run-program",
		type = "lldb-dap",
		request = "launch",
		stopOnEntry = false,
		runInTerminal = true,
		console = "integratedTerminal",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
	},
	{
		name = "lldb_dap-attach",
		request = "attach",
		type = "lldb-dap",
		stopOnEntry = true,
		runInTerminal = true,
		console = "integratedTerminal",
	},
}
DAP.configurations.rust = DAP.configurations.c
DAP.configurations.cpp = DAP.configurations.c
-- DAP.configurations.cs = {
-- 	{
-- 		name = "netcoredbg-run",
-- 		request = "launch",
-- 		type = "netcoredbg",
-- 		stopOnEntry = false,
-- 		runInTerminal = true,
-- 		console = "integratedTerminal",
-- 	},
-- 	{
-- 		name = "netcoredbg-attach",
-- 		request = "attach",
-- 		type = "netcoredbg",
-- 		stopOnEntry = false,
-- 		runInTerminal = true,
-- 		console = "integratedTerminal",
-- 	},
-- 	{
-- 		name = "netcoredbg-run-program",
-- 		request = "launch",
-- 		type = "netcoredbg",
-- 		stopOnEntry = false,
-- 		runInTerminal = true,
-- 		console = "integratedTerminal",
-- 		program = function()
-- 			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
-- 		end,
-- 	},
-- }
DAP.adapters.nlua = function(callback, config)
	callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
end
