-- General keybindings that aren't tied to specific plugins

vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split pane vertically' })
vim.keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split pane horizontally' })

-- Open Terminal in new pane
vim.keymap.set('n', '<leader>t', '<C-w>s<C-w>j:terminal<CR>', { desc = 'Open Terminal' })

-- navigate panes
vim.keymap.set('n', '<leader>h', '<C-w>h', { desc = 'Navigate pane left' })
vim.keymap.set('n', '<leader>j', '<C-w>j', { desc = 'Navigate pane down' })
vim.keymap.set('n', '<leader>k', '<C-w>k', { desc = 'Navigate pane up' })
vim.keymap.set('n', '<leader>l', '<C-w>l', { desc = 'Navigate pane right' })

-- close current pane
vim.keymap.set('n', '<leader>q', ':close<CR>', { desc = 'Close current pane' })

-- Close nvim
vim.keymap.set('n', '<leader>Q', ':qa!<CR>', { desc = 'Close nvim' })


-- Telescope keybindings
-- Navigate between results
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fs', require('telescope.builtin').grep_string, { desc = 'Telescope grep string' })

-- DAP keybindings
-- Debug
vim.keymap.set('n', '<F5>', require('dap').continue, { desc = 'Debug: Start/Continue' })
vim.keymap.set('n', '<F10>', require('dap').step_over, { desc = 'Debug: Step Over' })
vim.keymap.set('n', '<F11>', require('dap').step_into, { desc = 'Debug: Step Into' })
vim.keymap.set('n', '<F12>', require('dap').step_out, { desc = 'Debug: Step Out' })
vim.keymap.set('n', '<leader>b', require('dap').toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })

-- Utility keybindings
--vim.keymap.set('n', '<leader>xx', '<cmd>Trouble toggle<cr>', { desc = 'Toggle Trouble' })
