local dap = require("dap")
dap.adapters.cppdbg = {
	id = "cppdbg",
	type = "executable",
	command = "/home/e.evans/.vscode/extensions/ms-vscode.cpptools-1.19.9-linux-x64/debugAdapters/bin/OpenDebugAD7",
}

dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "cppdbg",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopAtEntry = true,
		setupCommands = {
			{
				text = "-enable-pretty-printing",
				description = "enable pretty printing",
				ignoreFailures = false,
			},
		},
	},
	{
		name = "Attach to gdbserver :1234",
		type = "cppdbg",
		request = "launch",
		MIMode = "gdb",
		miDebuggerServerAddress = "localhost:1234",
		miDebuggerPath = "/usr/bin/gdb",
		cwd = "${workspaceFolder}",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
	},
}

dap.configurations.c = {
	{
		name = "Launch file",
		type = "cppdbg",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopAtEntry = true,
		setupCommands = {
			{
				text = "-enable-pretty-printing",
				description = "enable pretty printing",
				ignoreFailures = false,
			},
		},
	},
	{
		name = "Attach to gdbserver :1234",
		type = "cppdbg",
		request = "launch",
		MIMode = "gdb",
		miDebuggerServerAddress = "localhost:1234",
		miDebuggerPath = "/usr/bin/gdb",
		cwd = "${workspaceFolder}",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
	},
}