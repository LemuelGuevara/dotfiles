local selected_theme = "zenbones"

local themes = {
	catppuccin = {
		"catppuccin/nvim",
		name = "catppuccin",
		opts = {
			flavour = "mocha",
			transparent_background = true,
		},
	},
	poimandres = {
		"olivercederborg/poimandres.nvim",
		opts = {
			config = true,
			disable_background = false, -- disable background
			disable_float_background = false, -- disable background for floats
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
