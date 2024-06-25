return {
	"michaelrommel/nvim-silicon",
	lazy = true,
	cmd = "Silicon",
	main = "nvim-silicon",
	init = function()
		local wk = require("which-key")
		wk.register({
			["s"] = {
				name = "Silicon",
				["s"] = {
					function()
						require("nvim-silicon").shoot()
					end,
					"Create code screenshot",
				},
				["f"] = {
					function()
						require("nvim-silicon").file()
					end,
					"Save code screenshot as file",
				},
				["c"] = {
					function()
						require("nvim-silicon").clip()
					end,
					"Copy code screenshot to clipboard",
				},
			},
		}, { prefix = "<leader>", mode = "v" })
	end,
	config = function()
		require("nvim-silicon").setup({
			theme = "Dracula",
			font = "Roboto Mono=26;Noto Emoji",
			window_title = function()
				return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
			end,
		})
	end,
}
