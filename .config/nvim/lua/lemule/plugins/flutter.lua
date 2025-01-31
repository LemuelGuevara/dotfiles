return {
	"nvim-flutter/flutter-tools.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim",
		"folke/which-key.nvim",
	},
	config = function()
		local flutter = require("flutter-tools")
		flutter.setup({
			widget_guides = {
				enabled = true,
			},
			settings = {
				enableSnippets = true,
			},
		})

		-- Set up which-key for Flutter commands
		local wk = require("which-key")
		wk.add({
			{ "<leader>f", group = "Flutter" },
			{ "<leader>fR", ":FlutterRun<CR>", desc = "Flutter Run" },
			{ "<leader>fq", ":FlutterQuit<CR>", desc = "Flutter Quit" },
			{ "<leader>fr", ":FlutterReload<CR>", desc = "Flutter Reload" },
			{ "<leader>fD", ":FlutterDevices<CR>", desc = "Flutter Devices" },
			{ "<leader>fE", ":FlutterEmulators<CR>", desc = "Flutter Emulators" },
			{ "<leader>fo", ":FlutterOutline<CR>", desc = "Flutter Outline" },
			{ "<leader>ft", ":FlutterDevTools<CR>", desc = "Flutter DevTools" },
			{ "<leader>fl", ":FlutterLogClear<CR>", desc = "Clear Flutter Logs" },
		})
	end,
}
