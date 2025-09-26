-- lua/plugins.lua

return {
  -- Example colorscheme
  { "folke/tokyonight.nvim", lazy = false, priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end
  },

  -- File explorer
  { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup()
    end
  },

  -- Statusline
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup()
    end
  },

  -- Mason
  --{ "williamboman/mason.nvim",
   -- config = function()
    --  require("mason").setup()
    --end
  --},

  -- Bridge
  { "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
	require("mason").setup()

      local mason_lspconfig = require("mason-lspconfig")
      mason_lspconfig.setup {
        ensure_installed = { "lua_ls", "basedpyright", "csharp_ls", "zls", "ols", "clangd", "rust_analyzer", "ts_ls" }, -- auto-install these
      	}

	  -- Define default on_attach and capabilities
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local on_attach = function(_, bufnr)
      local opts = { buffer = bufnr, silent = true }
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    end

    -- Setup handlers for each server
    mason_lspconfig.setup_handlers {
      function(server_name)
        vim.lsp.config[server_name] = {
          capabilities = capabilities,
          on_attach = on_attach,
        }
        -- Automatically start the server when entering a matching buffer
        vim.api.nvim_create_autocmd("FileType", {
          pattern = server_name, -- works for most servers
          callback = function(args)
            vim.lsp.start(vim.lsp.config[server_name], { bufnr = args.buf })
          end,
        })
      end
      }

        },

  -- Telescope (fuzzy finder)
  { "nvim-telescope/telescope.nvim", tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require("telescope")
      telescope.setup {
        defaults = {
          layout_config = { prompt_position = "top" },
          sorting_strategy = "ascending",
          winblend = 10,
        },
      }
      -- Keymaps
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep,  { desc = "Live grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers,    { desc = "Find buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags,  { desc = "Help tags" })
    end
  },
}
