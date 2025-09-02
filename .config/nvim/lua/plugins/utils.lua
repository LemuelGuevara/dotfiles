require("fidget").setup({})

-- Oil
require("oil").setup({
	delete_to_trash = true,
	columns = { "icon", "size" },
	keymaps = {
		["<C-h>"] = false,
		["<M-h>"] = "actions.select_split",
	},
	view_options = {
		show_hidden = true,
	},
	float = {
		padding = 10,
		max_width = 100,
		max_height = 0,
		border = "rounded",
		win_options = {
			winblend = 0,
		},
	},
})
vim.keymap.set("n", "\\", require("oil").toggle_float)

-- Tmux navigator
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>")
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>")
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>")

-- LazyGit
vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "Open LazyGit" })
