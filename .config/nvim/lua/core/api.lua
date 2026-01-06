vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "javascript", "typescript", "typescriptreact", "javascriptreact", "html", "css", "lua" },
	callback = function()
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})

-- Discord
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(opts)
		if opts.data.spec.name == "cord.nvim" and opts.data.kind == "update" then
			vim.cmd("Cord update")
		end
	end,
})

-- PackUpdate
vim.api.nvim_create_user_command("PackUpdate", function()
	print("Updating plugins...")
	vim.pack.update()
	print("Plugins updated!")
end, { desc = "Update all plugins (vim.pack)" })

-- Add auto rebuilding of nix files upon save
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.nix",
	callback = function()
		vim.cmd("split | term git add . && nix-rebuild && exit")
	end,
})
