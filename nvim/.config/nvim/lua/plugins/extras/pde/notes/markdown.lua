return {
	{ "AckslD/nvim-FeMaco.lua", ft = { "markdown" }, opts = {} },
	{
		"iamcco/markdown-preview.nvim",
		ft = { "markdown" },
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
	},
	{ "mzlogin/vim-markdown-toc", ft = { "markdown" } },
	-- {
	-- 	"renerocksai/telekasten.nvim",
	-- 	dependencies = { "nvim-telescope/telescope.nvim" },
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		opts = {
	-- 			home = vim.env.HOME .. "/notes/zettelkasten",
	-- 		}
	-- 		require("telekasten").setup(opts)

	-- 		local keymap = vim.keymap.set
	-- 		keymap(
	-- 			"n",
	-- 			"<leader>zz",
	-- 			"<cmd>Telekasten panel<cr>",
	-- 			{ noremap = true, silent = true, desc = "Show panel" }
	-- 		)
	-- 		keymap(
	-- 			"n",
	-- 			"<leader>zf",
	-- 			"<cmd>Telekasten find_notes<cr>",
	-- 			{ silent = true, noremap = true, desc = "Find notes" }
	-- 		)
	-- 		keymap("n", "<leader>zg", "<cmd>Telekasten search_notes<CR>", { silent = true, desc = "Search notes" })
	-- 		keymap("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>", { silent = true, desc = "Goto today" })
	-- 		keymap("n", "<leader>zt", "<cmd>Telekasten follow_link<CR>", { silent = true, desc = "Follow link" })
	-- 		keymap("n", "<leader>zn", "<cmd>Telekasten new_note<CR>", { silent = true, desc = "New note" })
	-- 		keymap("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>", { silent = true, desc = "Show calendar" })
	-- 		keymap("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>", { silent = true, desc = "Show backlinks" })
	-- 		keymap(
	-- 			"n",
	-- 			"<leader>zI",
	-- 			"<cmd>Telekasten insert_img_link<CR>",
	-- 			{ silent = true, desc = "Insert img link" }
	-- 		)
	-- 	end,
	-- },
	{
		"nvim-neorg/neorg",
		event = "VeryLazy",
		build = ":Neorg sync-parsers",
		config = function()
			require("neorg").setup({
				-- Tell Neorg what modules to load
				load = {
					["core.defaults"] = {}, -- Load all the default modules
					["core.norg.concealer"] = {}, -- Allows for use of icons
					["core.norg.dirman"] = { -- Manage your directories with Neorg
						config = {
							workspaces = {
								work = "~/notes/work",
								personal = "~/notes/personal",
							},
							default_workspace = "work",
						},
					},
				},
			})
		end,
	},
	{
		"epwalsh/obsidian.nvim",
		event = "VeryLazy",
		config = function()
			require("obsidian").setup({
				dir = "~/notes",
				note_id_func = function(title)
					-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
					local suffix = ""
					if title ~= nil then
						-- If title is given, transform it into valid file name.
						suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
					else
						-- If title is nil, just add 4 random uppercase letters to the suffix.
						for _ = 1, 4 do
							suffix = suffix .. string.char(math.random(65, 90))
						end
					end
					return tostring(os.time()) .. "-" .. suffix
				end,
			})
		end,
		notes_subdir = "zettelkasten",
		dailies = "dailies",
	},
	-- {
	-- 	"kien/ctrlp.vim",
	-- 	ft = { "markdown" },
	-- },
	-- {
	-- 	"lervag/wiki.vim",
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		vim.g.wiki_root = vim.env.HOME .. "/wiki"
	-- 	end,
	-- },
	-- { "toppair/peek.nvim", run = "deno task --quiet build:fast" },
	-- glow.nvim
	-- https://github.com/rockerBOO/awesome-neovim#markdown-and-latex
}
