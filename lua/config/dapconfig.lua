return {
	vim.keymap.set('n', '<F5>', function() require('dap').continue() end, { desc = "Continue" })
	vim.keymap.set('n', '<F10>', function() require('dap').step_over() end, { desc = "Step Over" })
	vim.keymap.set('n', '<F11>', function() require('dap').step_into() end, { desc = "Step Into" })
	vim.keymap.set('n', '<F12>', function() require('dap').step_out() end, { desc = "Step Out" })
	vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
	vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, { desc = "Set Conditional Breakpoint" })
	vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, { desc = "Set Log Point" })
	vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end, { desc = "Open REPL" })
	vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end, { desc = "Run Last" })

}
