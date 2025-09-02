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

vim.lsp.config("pyrefly", {})
vim.lsp.config("ts_ls", {
	on_attach = function(_, bufnr)
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

vim.lsp.config("rust-analyzer", {})
vim.diagnostic.config({ virtual_text = true })

vim.lsp.enable({
	"lua_ls",
	"pyrefly",
	"ts_ls",
	"rust-analyzer",
})
