return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "html",
                "cssls",
                "ts_ls",
                "ols",
                "zls",
                "clangd",
                "cmake",
                "lua_ls",
            },
            automatic_installation = true,
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = require('blink.cmp').get_lsp_capabilities(),
                        on_attach = function(client, bufnr)
                            local opts = { buffer = bufnr }
                            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                            vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                            vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
                            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
                        end,
                    })
                end,
            },
        })
    end,
}