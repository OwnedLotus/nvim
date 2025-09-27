-- lua/plugins.lua

return {
	-- Example colorscheme
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme tokyonight]])
		end,
	},

	-- Statusline
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup()
		end,
	},
	-- Telescope (fuzzy finder)
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				defaults = {
					layout_config = { prompt_position = "top" },
					sorting_strategy = "ascending",
					winblend = 10,
				},
			})

			-- Keymaps
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Find files" })
			vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Live grep" })
			vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "Find buffers" })
			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Help tags" })
		end,
	},

	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"basedpyright",
					"ts_ls",
					"rust_analyzer",
					"clangd",
					"zls",
					"ols",
				}, -- auto-install these
				automatic_installation = true,
			})

			local lspconfig = require("lspconfig")
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
					{ name = "path" },
				}),
			})
		end,
	},

	{
		"m4xshen/autoclose.nvim",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("autoclose").setup()
		end,
	},

	-- Formatter
	-- Mason bridge for formatters/linters
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		lazy = true,
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"prettier", -- JS/TS, CSS, HTML
					"stylua", -- Lua
					"black", -- Python
					"isort", -- Python imports
					"csharpier", -- C# formatter
					"clang-format", -- C++ formatter
					"cmakelang", -- CMAKE formatter
				},
				auto_update = true,
			})
		end,
	},

	-- Formatter plugin
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "isort", "black" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					json = { "prettier" },
					html = { "prettier" },
					css = { "prettier" },
				},
				format_on_save = {
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				},
			})
		end,
	},
	-- Core DAP plugin
	{ "mfussenegger/nvim-dap" },

	-- Mason bridge for DAP
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			require("mason-nvim-dap").setup({
				ensure_installed = { "python", "codelldb", ".NET" }, -- adapters to auto-install
				automatic_installation = true,
			})

			local dap = require("dap")

			-- Basic debugging
			vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP Continue/Start" })
			vim.keymap.set("n", "<F10>", dap.step_over, { desc = "DAP Step Over" })
			vim.keymap.set("n", "<F11>", dap.step_into, { desc = "DAP Step Into" })
			vim.keymap.set("n", "<F12>", dap.step_out, { desc = "DAP Step Out" })

			-- Breakpoints
			vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, { desc = "DAP Toggle Breakpoint" })
			vim.keymap.set("n", "<Leader>B", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { desc = "DAP Conditional Breakpoint" })

			-- REPL & UI
			vim.keymap.set("n", "<Leader>dr", dap.repl.open, { desc = "DAP Open REPL" })
			vim.keymap.set("n", "<Leader>dl", dap.run_last, { desc = "DAP Run Last" })

			-- If using nvim-dap-ui
			local dapui = require("dapui")
			vim.keymap.set("n", "<Leader>du", dapui.toggle, { desc = "DAP UI Toggle" })
		end,
	},

	-- DAP UI
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()

			-- Auto open/close UI
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},

	-- Csharp ls
	{
		"seblj/roslyn.nvim",
		lazy = true,
		config = function()
			on_attach = function(client, bufnr)
				--Keymap
			end
		end,
	},

	{
		"tris203/rzls.nvim",
		lazy = true,
		config = function()
			on_attach = function(client, bufnr)
				--Keymap
			end
		end,
	},

	-- Snippets (for Razor/C#)
	{ "hrsh7th/vim-vsnip", lazy = true },
	{ "OrangeT/vim-csharp", lazy = true },
}
