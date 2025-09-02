local selected_theme = "vague"

local themes = {
	vague = {
		"vague2k/vague.nvim",
		config = function()
			require("vague").setup({
				transparent = true,
				strings = "none",
			})
		end,
	},
	poimandres = {
		"olivercederborg/poimandres.nvim",
		opts = {
			config = true,
			disable_background = true, -- disable background
			disable_float_background = true, -- disable background for floats
		},
	},
	zenbones = {
		"zenbones-theme/zenbones.nvim",
		dependencies = {
			"rktjmp/lush.nvim",
		},
		otps = {
			config = true,
			darkness = "dark",
		},
	},
	mellifluous = {
		"ramojus/mellifluous.nvim",
		opts = {
			config = true,
			transparent_background = {
				enabled = true,
				floating_windows = true,
				telescope = true,
				file_tree = true,
				cursor_line = true,
				status_line = false,
			},
		},
	},
	["no-clown-fiesta"] = {
		"aktersnurra/no-clown-fiesta.nvim",
		opts = {
			config = true,
			transparent = true,
		},
	},
	["gruvbox-material"] = {
		"sainnhe/gruvbox-material",
		config = function()
			vim.g.gruvbox_material_enable_italic = true
			vim.cmd("colorscheme gruvbox-material")
		end,
	},
}

local function setup_themes()
	local configs = {}
	for name, spec in pairs(themes) do
		table.insert(configs, {
			spec[1],
			lazy = false,
			name = spec.name,
			priority = 1000,
			config = function()
				if spec.opts then
					local theme = require(name)
					if theme.setup then
						theme.setup(spec.opts)
					end
				end
				if selected_theme == name then
					vim.cmd.colorscheme(name)
				end
			end,
		})
	end
	return configs
end

return setup_themes()
