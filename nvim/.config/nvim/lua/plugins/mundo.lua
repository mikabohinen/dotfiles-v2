return {
	"simnalamburt/vim-mundo",
	event = "BufReadPre",
	config = function()
		vim.o.undofile = true
		vim.o.undodir = vim.fn.stdpath("cache") .. "/undo"
		vim.keymap.set("n", "<leader>u", "<cmd>MundoToggle<cr>", { noremap = true })
	end,
}
