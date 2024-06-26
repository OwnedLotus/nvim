-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  --use { "catppuccin/nvim", as = "catppuccin" }
  use { 'folke/tokyonight.nvim'}
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.6',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}
  use ('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
  use ('jvgrootveld/telescope-zoxide')
  use ('nvim-treesitter/playground')
  use ('mbbill/undotree')
  use ('tpope/vim-fugitive')
  use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
        }
  use ({
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup()
        end,
      })
  use {
  	'VonHeikemen/lsp-zero.nvim',
  	branch = 'v3.x',
  	requires = {
    --- Uncomment the two plugins below if you want to manage the language servers from neovim
    		{'williamboman/mason.nvim'},
    		{'williamboman/mason-lspconfig.nvim'},

    		{'neovim/nvim-lspconfig'},
    		{'hrsh7th/nvim-cmp'},
    		{'hrsh7th/cmp-nvim-lsp'},
    		{'L3MON4D3/LuaSnip'},
  }
}
    use ( "David-Kunz/gen.nvim" )
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio", "theHamsta/nvim-dap-virtual-text"} }
--    use { "jay-babu/mason-nvim-dap.nvim" }
--    use { "hrsh7th/cmp-nvim-lsp-signature-help" }
end)
