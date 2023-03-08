return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-project.nvim",
			"ahmedkhalf/project.nvim",
			"cljoly/telescope-repo.nvim",
			"stevearc/aerial.nvim",
			"nvim-telescope/telescope-frecency.nvim",
			"kkharji/sqlite.lua",
			"nvim-telescope/telescope-fzf-writer.nvim",
			{
				"nvim-telescope/telescope-symbols.nvim",
				config = function()
					local keymap = vim.keymap.set
					keymap(
						"n",
						"<leader>ve",
						"<cmd>Telescope symbols<cr>",
						{ noremap = true, silent = true, desc = "Emojis" }
					)
				end,
			},
			{
				"nvim-telescope/telescope-media-files.nvim",
				config = function()
					require("telescope").load_extension("media_files")
				end,
			},
		},
		cmd = "Telescope",
    -- stylua: ignore
    keys = {
      { "<leader><space>", require("utils").find_files, desc = "Find Files" },
      { "<leader>ff", require("utils").find_files, desc = "Find Files" },
      { "<leader>fo", "<cmd>Telescope frecency theme=dropdown previewer=false<cr>", desc = "Recent" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fr", "<cmd>Telescope file_browser<cr>", desc = "Browser" },
      { "<leader>ps", "<cmd>Telescope repo list<cr>", desc = "Search" },
      { "<leader>hs", "<cmd>Telescope help_tags<cr>", desc = "Search" },
      { "<leader>pp", function() require("telescope").extensions.project.project { display_type = "minimal" } end, desc = "List", },
      { "<leader>sw", "<cmd>Telescope live_grep<cr>", desc = "Workspace" },
      { "<leader>sb", function() require("telescope.builtin").current_buffer_fuzzy_find() end, desc = "Buffer", },
      { "<leader>vo", "<cmd>Telescope aerial<cr>", desc = "Code Outline" },
      { "<leader>lc", function() require("telescope.builtin").colorscheme({enable_preview = true}) end, desc = "Colorscheme", },
      { "<leader>st", function() require("telescope.builtin").tags({
        prompt_title = "Search tags",
        initial_mode = "insert",
        layout_strategy = "horizontal",
        layout_config = {
          preview_width = 0.6,
          width = 0.9,
          height = 0.6,
        },
        only_sort_tags = true,
      })end, desc = "Tags"},
    },
		config = function(_, _)
			local telescope = require("telescope")
			local icons = require("config.icons")
			local actions = require("telescope.actions")
			local actions_layout = require("telescope.actions.layout")
			local mappings = {
				i = {
					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
					["<C-n>"] = actions.cycle_history_next,
					["<C-p>"] = actions.cycle_history_prev,
					["?"] = actions_layout.toggle_preview,
				},
			}

			local opts = {
				defaults = {
					prompt_prefix = icons.ui.Telescope .. " ",
					selection_caret = icons.ui.Forward .. " ",
					mappings = mappings,
					border = {},
					borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
					color_devicons = true,
				},
				pickers = {
					find_files = {
						theme = "dropdown",
						previewer = false,
						hidden = true,
						find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
					},
					git_files = {
						theme = "dropdown",
						previewer = false,
					},
					buffers = {
						theme = "dropdown",
						previewer = false,
					},
				},
				extensions = {
					file_browser = {
						theme = "dropdown",
						previewer = false,
						hijack_netrw = true,
						mappings = mappings,
					},
					project = {
						hidden_files = false,
						theme = "dropdown",
					},
					fzf_writer = {
						minimum_grep_characters = 2,
						minimum_files_characters = 2,
						use_highlighter = true,
					},
				},
			}
			telescope.setup(opts)
			telescope.load_extension("fzf")
			telescope.load_extension("file_browser")
			telescope.load_extension("project")
			telescope.load_extension("projects")
			telescope.load_extension("aerial")
			telescope.load_extension("dap")
			telescope.load_extension("frecency")
		end,
	},
	{
		"stevearc/aerial.nvim",
		config = true,
	},
	{
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({
				detection_methods = { "pattern", "lsp" },
				patterns = { ".git" },
				ignore_lsp = { "null-ls" },
			})
		end,
	},
}
