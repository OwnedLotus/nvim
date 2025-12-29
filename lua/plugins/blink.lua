return {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "rafamadriz/friendly-snippets",
    },
    config = function()
         require("blink.cmp").setup({
             keymap = {
                 preset = "default",
                 ["<CR>"] = { "accept", "fallback" },
                 ["<Tab>"] = { "select_next", "fallback" },
                 ["<S-Tab>"] = { "select_prev", "fallback" },
                 ["<C-e>"] = { "cancel", "fallback" },
             },
             appearance = {
                 nerd_font_variant = "mono",
             },
             sources = {
                 default = { "lsp", "path", "snippets", "buffer" },
                 providers = {
                     lsp = {
                         name = "blink.cmp.lsp",
                         module = "blink.cmp.sources.lsp",
                     },
                     path = {
                         name = "blink.cmp.path",
                         module = "blink.cmp.sources.path",
                     },
                     snippets = {
                         name = "blink.cmp.snippets",
                         module = "blink.cmp.sources.snippets",
                     },
                     buffer = {
                         name = "blink.cmp.buffer",
                         module = "blink.cmp.sources.buffer",
                     },
                 },
             },
             completion = {
                 menu = {
                     border = "rounded",
                     winblend = 10,
                     draw = {
                         columns = { { "kind_icon", "label", "label_description", gap = 1 } },
                     },
                 },
                 documentation = {
                     window = {
                         border = "rounded",
                         winblend = 10,
                     },
                 },
             },
         })
    end,
}