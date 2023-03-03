return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local neogen = require("neogen")
			local icons = require("config.icons")
			local compare = require("cmp.config.compare")
			local lspkind = require("lspkind")

			local has_words_before = function()
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			cmp.setup({
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				sorting = {
					priority_weight = 2,
					comparators = {
						compare.score,
						compare.recently_used,
						compare.offset,
						compare.exact,
						compare.kind,
						compare.sort_text,
						compare.length,
						compare.order,
					},
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping({
						i = vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<CR>", true, true, true), "n", true),
						c = function(fallback)
							if cmp.visible() then
								cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
							else
								fallback()
							end
						end,
					}),
					["/"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = false,
					}),
					["jk"] = cmp.mapping(function(fallback)
						if luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end),
					["kj"] = cmp.mapping(function(fallback)
						if luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end),
					["<C-j>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end, {
						"i",
						"s",
						"c",
					}),
					["<C-k>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end, {
						"i",
						"s",
						"c",
					}),
				}),
				sources = cmp.config.sources({
					{ name = "copilot" },
					{ name = "nvim_lsp_signature_help" },
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "orgmode" },
					{ name = "path" },
				}),
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = lspkind.cmp_format({
						mode = "symbol",
						maxwidth = 50,
						ellipsis_char = "...",
						symbol_map = { Copilot = "" },
					}),
				},
			})

			-- Auto pairs
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			{
				"rafamadriz/friendly-snippets",
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
				end,
			},
			{
				"honza/vim-snippets",
				config = function()
					require("luasnip.loaders.from_snipmate").lazy_load()

					-- One peculiarity of honza/vim-snippets is that the file with the global snippets is _.snippets, so global snippets
					-- are stored in `ls.snippets._`.
					-- We need to tell luasnip that "_" contains global snippets:
					require("luasnip").filetype_extend("all", { "_" })
				end,
			},
		},
		build = "make install_jsregexp",
		opts = {
			history = true,
			delete_check_events = "TextChanged",
		},
    -- stylua: ignore
    -- keys = {
    --   {
    --     "<C-j>",
    --     function()
    --       return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<C-j>"
    --     end,
    --     expr = true, remap = true, silent = true, mode = "i",
    --   },
    --   { "<C-j>", function() require("luasnip").jump(1) end, mode = "s" },
    --   { "<C-k>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    -- },
		config = function(_, opts)
			require("luasnip").setup(opts)

      require("luasnip").config.set_config({
        enable_autosnippets = true,
        store_selection_keys = "<C-e>",
        updateevents = "TextChanged,TextChangedI",
      })

			local snippets_folder = vim.fn.stdpath("config") .. "/lua/plugins/completion/snippets/"
			require("luasnip.loaders.from_lua").lazy_load({ paths = snippets_folder })

			vim.api.nvim_create_user_command("LuaSnipEdit", function()
				require("luasnip.loaders.from_lua").edit_snippet_files()
			end, {})

      vim.keymap.set(
        "n",
        "<Leader>L",
        "<cmd>lua require('luasnip.loaders.from_lua').load({paths = '~/.config/nvim/lua/plugins/completion/snippets/'})<CR>",
        { silent = true, noremap = true, desc = "Reload LuaSnip" }
      )
		end,
	},
}
