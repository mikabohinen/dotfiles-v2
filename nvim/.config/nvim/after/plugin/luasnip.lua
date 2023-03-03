require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/LuaSnip/" })

require("luasnip").config.set_config({ -- Setting LuaSnip config

  -- Enable autotriggered snippets
  enable_autosnippets = true,

  -- Use Tab (or some other key if you prefer) to trigger visual selection
  store_selection_keys = "<Tab>",

  -- Automatically update the snippet when the text changes
  updateevents = "TextChanged,TextChangedI",
})

vim.keymap.set({ "i", "s" }, "jk", function()
  require("luasnip").jump(1)
end, { desc = "LuaSnip forward jump" })
vim.keymap.set({ "i", "s" }, "kj", function()
  require("luasnip").jump(1)
end, { desc = "LuaSnip forward jump" })
vim.keymap.set({ "i", "s" }, "<C-,>", function()
  require("luasnip").jump(-1)
end, { desc = "LuaSnip backward jump" })

-- add keymap to select between choice nodes
vim.keymap.set({ "i", "s" }, "<C-f>", function()
  require("luasnip").choice_next()
end, { desc = "LuaSnip choice next" })

vim.keymap.set({ "i", "s" }, "<C-b>", function()
  require("luasnip").choice_prev()
end, { desc = "LuaSnip choice prev" })

vim.keymap.set(
  "n",
  "<Leader>L",
  '<Cmd>lua require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})<CR>',
  { desc = "Reload LuaSnip" }
)

vim.cmd([[
	" Cycle forward through choice nodes with Control-f (for example)
	imap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
	smap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
]])
