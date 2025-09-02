local ensure_installed = {
	-- Formatters
	"stylua", -- Lua
	"prettierd", -- JS/TS/HTML/CSS
	"ruff", -- Python

	-- Linters
	"eslint_d", -- JS/TS
	"selene", -- Lua

	-- LSP Servers
	"pyrefly",
	"lua-language-server", -- Lua
	"typescript-language-server", -- JS/TS
	"tailwindcss-language-server",
	"json-lsp", -- JSON
	"rust-analyzer", -- Rust
}

require("nvim-treesitter").install({
	"bash",
	"c",
	"diff",
	"html",
	"java",
	"javascript",
	"jsdoc",
	"json",
	"jsonc",
	"lua",
	"luadoc",
	"luap",
	"luau",
	"markdown",
	"markdown_inline",
	"printf",
	"python",
	"query",
	"regex",
	"rust",
	"toml",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",
	"xml",
	"yaml",
})

require("mason").setup({ max_concurrent_installers = 4 })
require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

require("blink.cmp").setup({
	fuzzy = { implementation = "prefer_rust_with_warning" },
	signature = { enabled = true },
	keymap = {
		preset = "enter",
	},
	appearance = {
		nerd_font_variant = "normal",
		use_nvim_cmp_as_default = true,
	},
	completion = {
		list = {
			selection = {
				preselect = true,
				auto_insert = false,
			},
		},
		documentation = {
			auto_show = true,
		},
	},
	cmdline = {
		keymap = {
			preset = "inherit",
			["<CR>"] = { "accept_and_enter", "fallback" },
		},
	},
})

require("nvim-autopairs").setup({
	disable_filetype = { "TelescopePrompt", "vim" },
	ignored_next_char = "[%w%.]",
	enable_check_bracket_line = false,
	check_ts = true,
	ts_config = {
		lua = { "string" },
		javascript = { "template_string" },
		java = false,
	},
	fast_wrap = {},
})

require("conform").setup({
	formatters_by_ft = {
		javascript = { "prettierd" },
		typescript = { "prettierd" },
		javascriptreact = { "prettierd" },
		typescriptreact = { "prettierd" },
		css = { "prettierd" },
		html = { "prettierd" },
		json = { "prettierd" },
		yaml = { "prettierd" },
		markdown = { "prettierd" },
		lua = { "stylua" },
		python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
	},
	format_on_save = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 5000,
	},
})

require("nvim-ts-autotag").setup({})
