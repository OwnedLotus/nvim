# AGENTS.md

This repository is a Neovim configuration using Lua and the lazy.nvim plugin manager. This guide helps agentic coding agents understand the codebase structure and conventions.

## Project Structure

```
.
├── init.lua                 # Main entry point
├── lazy-lock.json          # Plugin lockfile
└── lua/
    ├── config/             # Configuration modules
    │   ├── lazy.lua        # Plugin manager setup
    │   ├── lsp.lua         # LSP configuration and keybindings
    │   ├── diagnostics.lua # Diagnostic settings
    │   └── options.lua     # Basic editor options
    └── plugins/            # Plugin specifications
```

## Build/Lint/Test Commands

This is a Neovim configuration repository - traditional build/test commands don't apply. Instead:

- **Load config**: Start Neovim normally (`nvim`) - configuration loads automatically
- **Plugin management**: Run `:Lazy` in Neovim to manage plugins
- **LSP diagnostics**: LSP provides linting via `vim.lsp.buf.format()` on save
- **Configuration validation**: Neovim will error on startup if Lua syntax is invalid

### Single File Testing
No test framework is configured. To test individual configuration files:
1. Start Neovim: `nvim`
2. Reload specific config: `:lua dofile('path/to/file.lua')`
3. Check for errors with `:lua print("Config loaded successfully")`

## Code Style Guidelines

### General Lua Style
- Use 2 spaces for indentation (configured in `options.lua`)
- Expand tabs to spaces (`expandtab = true`)
- Use smart indentation (`smartindent = true`)
- Prefer modern Lua 5.1+ syntax compatible with Neovim's LuaJIT

### Module Structure
Each file should return a single value:
```lua
-- Plugin configuration (lua/plugins/example.lua)
return {
    "plugin-author/plugin-name",
    config = function()
        -- Configuration logic
    end,
}
```

```lua
-- Configuration module (lua/config/example.lua)
vim.opt.some_option = true
vim.keymap.set('n', '<leader>key', function()
    -- Keybinding logic
end, { desc = 'Description' })
```

### Imports and Requires
- Use `require()` for module imports
- Place requires at the top of files or within config functions
- Use local variables for frequently accessed modules:
```lua
local builtin = require('telescope.builtin')
```

### Naming Conventions
- **Files**: lowercase with hyphens for plugins (e.g., `telescope.lua`)
- **Variables**: `snake_case` for local variables
- **Functions**: `snake_case` for regular functions
- **Config options**: Use vim.opt API: `vim.opt.option_name = value`

### Error Handling
- Use vim.api.nvim_echo for user-facing error messages
- Check shell errors when running external commands:
```lua
local out = vim.fn.system({ "command" })
if vim.v.shell_error ~= 0 then
    -- Handle error
end
```

### Plugin Configuration Patterns
- Plugin specs follow lazy.nvim format
- Use config functions for setup logic
- Include version constraints when necessary
- Declare dependencies explicitly

### Keybinding Conventions
- Use leader key (`<leader>`) for custom mappings
- Include descriptive text for which-key integration:
```lua
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
```
- Follow existing patterns: `<leader>f` for find/file operations, `<leader>g` for git/operations

### LSP Configuration
- Attach keybindings in `LspAttach` autocmd
- Enable format-on-save via LSP
- Use buffer-local options for LSP mappings

### Autocommands
- Create named augroups for organization
- Use buffer-specific autocmds when possible
- Clean up autocmds to prevent memory leaks

## Common Patterns

### Adding a New Plugin
1. Create file in `lua/plugins/plugin-name.lua`
2. Return plugin spec table
3. Configure in config function if needed

### Adding Configuration Options
1. Add to appropriate file in `lua/config/`
2. Use vim.opt API for options
3. Test with `:lua dofile('lua/config/file.lua')`

### Debugging Configuration
- Use `:lua print(variable)` to inspect values
- Check `:lua vim.print(table)` for tables
- Reload entire config with `:lua dofile('init.lua')`

## Notes for Agents
- This is personal Neovim config, modify with care
- Plugin versions pinned in lazy-lock.json for stability
- LSP formatting is enabled automatically on save
- Configuration focuses on minimal, functional setup
- No build system - validation happens on Neovim startup