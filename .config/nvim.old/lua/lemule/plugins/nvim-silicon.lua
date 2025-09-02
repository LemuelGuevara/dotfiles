return {
	"michaelrommel/nvim-silicon",
	lazy = true,
	cmd = "Silicon",
	main = "nvim-silicon",
	keys = {
		{
			"<leader>ss",
			function()
				require("nvim-silicon").shoot()
			end,
			desc = "Create code screenshot",
			mode = "v",
		},
		{
			"<leader>sf",
			function()
				require("nvim-silicon").file()
			end,
			desc = "Save code screenshot as file",
			mode = "v",
		},
		{
			"<leader>sc",
			function()
				require("nvim-silicon").clip()
			end,
			desc = "Copy code screenshot to clipboard",
			mode = "v",
		},
	},
	opts = {
		theme = "Dracula",
		font = "Roboto Mono=26;Noto Emoji",
		window_title = function()
			return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
		end,
	},
}
