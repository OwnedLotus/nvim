return {
    "mfussenegger/nvim-dap",
    "jay-babu/mason-nvim-dap.nvim",
    event = "BufReadPre",
    config = function()
        require("mason").setup()
        require("mason-nvim-dap").setup({
            ensure_installed = { "cppdbg", "codelldb", "debugpy", "coreclr" }
        })

        local dap = require("dap")
        local mason_path = vim.fn.stdpath("data") .. "/mason/bin/"

        -- C++ configuration
        dap.adapters.cppdbg = {
            id = 'cppdbg',
            type = 'executable',
            command = mason_path .. 'OpenDebugAD7',
            args = {}
        }
        dap.configurations.cpp = {
            {
                name = "Launch file",
                type = "cppdbg",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
                setupCommands = {
                    {
                        text = '-enable-pretty-printing',
                        description = 'Enable pretty printing',
                        ignoreFailures = false
                    }
                }
            }
        }

        -- Rust configuration
        dap.adapters.codelldb = {
            type = 'server',
            port = "${port}",
            executable = {
                command = mason_path .. 'codelldb',
                args = {"--port", "${port}"}
            }
        }
        dap.configurations.rust = {
            {
                name = "Launch",
                type = "codelldb",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
                args = {},
                runInTerminal = false
            }
        }

        -- Python configuration
        dap.adapters.python = {
            type = 'executable',
            command = mason_path .. 'debugpy-adapter',
            args = { }
        }
        dap.configurations.python = {
            {
                type = 'python',
                request = 'launch',
                name = "Launch file",
                program = "${file}",
                pythonPath = function()
                    return '/usr/bin/python'
                end
            }
        }
	dap.adapters.coreclr = {
            type = 'executable',
            command = mason_path .. 'netcoredbg',
            args = {'--interpreter=vscode'}
        }
	dap.configurations.cs = {
            {
                type = 'coreclr',
                name = 'launch - netcoredbg',
                request = 'launch',
                program = function()
                    return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
                end,
            },
        }
    end
}

