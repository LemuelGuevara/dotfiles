require("snacks").setup({
	picker = { enabled = true },
})

local snacks = require("snacks")

vim.keymap.set("n", "<leader><space>", snacks.picker.smart, { desc = "Smart Find Files" })
vim.keymap.set("n", "<leader>/", snacks.picker.grep, { desc = "Grep" })
vim.keymap.set("n", "<leader>:", snacks.picker.command_history, { desc = "Command History" })
vim.keymap.set("n", "<leader>n", snacks.picker.notifications, { desc = "Notification History" })

-- find
vim.keymap.set("n", "<leader>fb", snacks.picker.buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fc", function()
	snacks.picker.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Find Config File" })
vim.keymap.set("n", "<leader>fn", function()
    snacks.picker.files({ cwd = vim.fn.expand("~/nixos-dotfiles/") })
end, { desc = "Find NixOS Dotfiles" })
vim.keymap.set("n", "<leader>ff", snacks.picker.files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", snacks.picker.git_files, { desc = "Find Git Files" })
vim.keymap.set("n", "<leader>fp", snacks.picker.projects, { desc = "Projects" })
vim.keymap.set("n", "<leader>fr", snacks.picker.recent, { desc = "Recent" })

-- Grep
vim.keymap.set("n", "<leader>sb", snacks.picker.lines, { desc = "Buffer Lines" })
vim.keymap.set("n", "<leader>sB", snacks.picker.grep_buffers, { desc = "Grep Open Buffers" })
vim.keymap.set({ "n", "x" }, "<leader>sw", snacks.picker.grep_word, { desc = "Visual selection or word" })

-- search
vim.keymap.set("n", [[<leader>s"]], snacks.picker.registers, { desc = "Registers" })
vim.keymap.set("n", "<leader>s/", snacks.picker.search_history, { desc = "Search History" })
vim.keymap.set("n", "<leader>sa", snacks.picker.autocmds, { desc = "Autocmds" })
vim.keymap.set("n", "<leader>sb", snacks.picker.lines, { desc = "Buffer Lines" })
vim.keymap.set("n", "<leader>sc", snacks.picker.command_history, { desc = "Command History" })
vim.keymap.set("n", "<leader>sC", snacks.picker.commands, { desc = "Commands" })
vim.keymap.set("n", "<leader>sd", snacks.picker.diagnostics, { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>sD", snacks.picker.diagnostics_buffer, { desc = "Buffer Diagnostics" })
vim.keymap.set("n", "<leader>sh", snacks.picker.help, { desc = "Help Pages" })
vim.keymap.set("n", "<leader>sH", snacks.picker.highlights, { desc = "Highlights" })
vim.keymap.set("n", "<leader>si", snacks.picker.icons, { desc = "Icons" })
vim.keymap.set("n", "<leader>sj", snacks.picker.jumps, { desc = "Jumps" })
vim.keymap.set("n", "<leader>sk", snacks.picker.keymaps, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>sl", snacks.picker.loclist, { desc = "Location List" })
vim.keymap.set("n", "<leader>sm", snacks.picker.marks, { desc = "Marks" })
vim.keymap.set("n", "<leader>sM", snacks.picker.man, { desc = "Man Pages" })
vim.keymap.set("n", "<leader>sp", snacks.picker.lazy, { desc = "Search for Plugin Spec" })
vim.keymap.set("n", "<leader>sq", snacks.picker.qflist, { desc = "Quickfix List" })
vim.keymap.set("n", "<leader>sR", snacks.picker.resume, { desc = "Resume" })
vim.keymap.set("n", "<leader>su", snacks.picker.undo, { desc = "Undo History" })
vim.keymap.set("n", "<leader>uC", snacks.picker.colorschemes, { desc = "Colorschemes" })

-- LSP
vim.keymap.set("n", "gd", snacks.picker.lsp_definitions, { desc = "Goto Definition" })
vim.keymap.set("n", "gD", snacks.picker.lsp_declarations, { desc = "Goto Declaration" })
vim.keymap.set("n", "gR", snacks.picker.lsp_references, { desc = "References" })
vim.keymap.set("n", "gy", snacks.picker.lsp_type_definitions, { desc = "Goto T[y]pe Definition" })
vim.keymap.set("n", "<leader>ss", snacks.picker.lsp_symbols, { desc = "LSP Symbols" })
vim.keymap.set("n", "<leader>sS", snacks.picker.lsp_workspace_symbols, { desc = "LSP Workspace Symbols" })

local keymap = vim.keymap

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf, silent = true }

		opts.desc = "See available code actions"
		keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

		opts.desc = "Smart rename"
		keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

		opts.desc = "Show line diagnostics"
		keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

		opts.desc = "Restart LSP"
		keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
	end,
})
