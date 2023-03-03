-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap("n", "o", "o<ESC>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "O", "O<ESC>", { noremap = true, silent = true })
