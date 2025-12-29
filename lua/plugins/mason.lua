return {
    "williamboman/mason.nvim",
    config = function()
        require("mason").setup({
            registries = {
                'github:mason-org/mason-registry', -- official registry
                'github:Crashdummyy/mason-registry', -- community registry with Roslyn
            },
        })
    end,
}