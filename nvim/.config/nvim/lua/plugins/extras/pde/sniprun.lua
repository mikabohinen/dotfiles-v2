return {
	{
		"michaelb/sniprun",
		-- enabled = false,
		build = "bash ./install.sh",
		ft = { "python" },
		opts = {
			display = { "Terminal" },
			selected_interpreters = { "Python3_jupyter" },
		},
		config = function(_, opts)
			require("sniprun").setup(opts)
			local keymap = vim.keymap.set

			keymap("n", "<leader>ra", "ggVG:SnipRun<cr>", { silent = true, desc = "All" })
			keymap({ "n", "v" }, "<leader>rr", "<Plug>SnipRun", { silent = true, desc = "Current" })
			keymap("n", "<leader>ro", "<Plug>SnipRunOperator", { silent = true, desc = "Operator" })
			keymap("n", "<leader>rR", "<Plug>SnipReset", { silent = true, desc = "Reset" })
			keymap("n", "<leader>rC", "<Plug>SnipReplMemoryClean", { silent = true, desc = "Clean Memory" })
			keymap("n", "<leader>rc", "<Plug>SnipClose", { silent = true, desc = "Close" })
			keymap("n", "<leader>rl", "<Plug>SnipLive", { silent = true, desc = "Live" })
		end,
		--stylua: ignore
	},
}
