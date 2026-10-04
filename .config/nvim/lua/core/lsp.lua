vim.lsp.config("*", {
	capabilities = {
		textDocument = {
			semanticTokens = {
				multilineTokenSupport = true,
			},
		},
	},
	root_markers = { ".git" },
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			completion = { callSnippet = "Replace" },
		},
	},
})

vim.lsp.config("pyrefly", {
	settings = {
		python = {
			filetypes = { "python" },
			root_markers = {
				"pyrefly.toml",
				"pyproject.toml",
				"setup.py",
				"setup.cfg",
				"requirements.txt",
				"Pipfile",
				".git",
			},
			displayTypeErrors = true,
		},
	},
})
vim.lsp.config("tsc", {
	on_attach = function(_, bufnr)
		local function organize_imports()
			vim.lsp.buf.code_action({
				context = { only = { "source.organizeImports" }, diagnostics = {} },
				apply = true,
			})
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

vim.lsp.config("rust-analyzer", {})
vim.lsp.config("ty", {
	settings = {
		ty = {
			diagnosticMode = "workspace",
			inlayHints = {
				variableTypes = true,
			},
			experimental = {
				rename = true,
				autoImport = true,
			},
		},
	},
})
vim.lsp.config("tailwindcss", {})
vim.lsp.config("nixd", {
	cmd = { "nixd" },
	settings = {
		nixd = {
			nixpkgs = {
				expr = "import <nixpkgs> { }",
			},
			formatting = {
				command = { "nixfmt" },
			},
		},
	},
})

vim.diagnostic.config({ virtual_text = true })

vim.lsp.enable({
	"lua_ls",
	"ty",
	"tsc",
	"tailwindcss",
	"rust-analyzer",
	"nixd",
	"oxfmt",
})
