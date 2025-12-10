return {
  {
    'williamboman/mason.nvim',
    opts = {
      registries = {
        'github:mason-org/mason-registry', -- official registry
        'github:Crashdummyy/mason-registry', -- community registry with Roslyn
      },
    },
  },
}
