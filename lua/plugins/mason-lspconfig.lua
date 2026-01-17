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
        "lua_ls",
      },
      automatic_installation = true,
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = require('blink.cmp').get_lsp_capabilities(),
            on_attach = function(client, bufnr)
              -- LSP keybindings are handled in lua/config/lsp.lua
            end,
          })
        end,
      },
    })
  end,
}

