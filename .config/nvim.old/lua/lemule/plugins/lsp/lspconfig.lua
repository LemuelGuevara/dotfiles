return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"folke/lazydev.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"mason-org/mason-lspconfig.nvim",
		"ibhagwan/fzf-lua",

		-- Status updates for LSP
		{ "j-hui/fidget.nvim", opts = {} },
	},
	config = function()
		-- local fzf = require("fzf-lua")
		local snacks = require("snacks")
		local picker = snacks.picker
		local keymap = vim.keymap

		require("mason-lspconfig").setup({
			automatic_enable = { exclude = { "ruff" } },
			ensure_installed = {},
		})

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				opts.desc = "Show LSP references"
				keymap.set("n", "gR", picker.lsp_references, opts)
				--
				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- builtin
				--
				opts.desc = "Show LSP definitions"
				keymap.set("n", "gd", picker.lsp_definitions, opts)
				--
				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", picker.lsp_implementations, opts)
				--
				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", picker.lsp_type_definitions, opts)

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- builtin

				-- opts.desc = "Show buffer diagnostics"
				-- keymap.set("n", "<leader>D", fzf.diagnostics_document, opts)
				--
				-- opts.desc = "Show workspace diagnostics"
				-- keymap.set("n", "<leader>WD", fzf.diagnostics_workspace, opts)

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", function()
					vim.lsp.buf.hover({
						border = "rounded",
						max_height = 25,
						max_width = 120,
					})
				end, opts)

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
			end,
		})

		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = "󰠠 ",
					[vim.diagnostic.severity.INFO] = " ",
				},
			},
			float = {
				border = "rounded",
				max_width = 120,
				max_height = 25,
				focusable = false,
				source = "always",
				header = "",
				prefix = "",
			},
		})

		-- enable autocompletion capabilities
		local capabilities =
			vim.tbl_extend("force", vim.lsp.protocol.make_client_capabilities(), cmp_nvim_lsp.default_capabilities())

		vim.lsp.config("*", {
			capabilities = capabilities,
			on_attach = function(_, bufnr)
				vim.treesitter.start(bufnr)
			end,
		})

		vim.lsp.config("ts_ls", {
			on_attach = function(_, bufnr)
				vim.lsp.config["*"].on_attach(_, bufnr)

				local function organize_imports()
					vim.lsp.buf_request_sync(bufnr, "workspace/executeCommand", {
						command = "_typescript.organizeImports",
						arguments = { vim.api.nvim_buf_get_name(bufnr) },
						title = "",
					}, 500)

					vim.notify("Imports Organized", vim.log.levels.INFO)
				end

				vim.keymap.set(
					"n",
					"<leader>oi",
					organize_imports,
					{ buffer = bufnr, desc = "Organize Imports", silent = true }
				)
				vim.api.nvim_buf_create_user_command(
					bufnr,
					"OrganizeImports",
					organize_imports,
					{ desc = "Organize TS imports" }
				)
			end,
		})

		vim.lsp.config("pyrefly", {})

		vim.lsp.config("eslint", {
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		})

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
					completion = { callSnippet = "Replace" },
				},
			},
		})

		vim.lsp.config("jdtls", {
			init_options = {
				settings = {
					java = {
						project = { sourcePaths = { "src" } },
						configuration = { runtimes = { { path = vim.env.JAVA_HOME } } },
					},
				},
			},
		})
	end,
}
