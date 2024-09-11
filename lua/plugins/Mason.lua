return {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
        require("mason").setup({
            -- The directory where Mason will install packages
            install_root_dir = vim.fn.stdpath("data") .. "/mason",

            -- Automatically install packages that are missing when starting Neovim
            auto_update = true,

            -- Set to true to automatically check for updates when starting Neovim
            check_outdated_packages_on_open = true,

            -- The list of servers to ensure are installed
            ensure_installed = { "lua_ls", "pyright", "rust_analyzer", "tsserver", "csharp_language_server" },

            -- Additional settings
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })
    end
}

