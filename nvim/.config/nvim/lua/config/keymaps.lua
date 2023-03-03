local keymap = vim.keymap.set

-- Essential for me
keymap("n", "o", "o<esc>")
keymap("n", "O", "O<esc>")

-- Window splitting
keymap("n", "<leader>|", ":vsplit<CR>", { silent = true, desc = "Split vertically" })
keymap("n", "<leader>-", ":split<CR>", { silent = true, desc = "Split horizontally" })
keymap("n", "<leader>w|", ":vsplit<CR>", { silent = true, desc = "Split vertically" })
keymap("n", "<leader>w-", ":split<CR>", { silent = true, desc = "Split horizontally" })

-- Close window
keymap("n", "<leader>wd", "<C-w>q", { silent = true, noremap = true, desc = "Close window" })

-- Maximize current window
keymap("n", "<leader>wm", "<C-w>|<C-w>_", { silent = true, noremap = true, desc = "Maximize current window" })

-- Equalize window sizes
keymap("n", "<leader>we", "<C-w>=", { silent = true, noremap = true, desc = "Equalize window sizes" })

-- Switching between buffers
keymap("n", "H", ":bp<CR>", { silent = true })
keymap("n", "L", ":bn<CR>", { silent = true })

-- Remap for dealing with word wrap
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Better viewing
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")
keymap("n", "g,", "g,zvzz")
keymap("n", "g;", "g;zvzz")

-- Better escape using jk in insert and terminal mode
keymap("t", "<C-h>", "<C-\\><C-n><C-w>h")
keymap("t", "<C-j>", "<C-\\><C-n><C-w>j")
keymap("t", "<C-k>", "<C-\\><C-n><C-w>k")
keymap("t", "<C-l>", "<C-\\><C-n><C-w>l")

-- Add undo break-points
keymap("i", ",", ",<c-g>u")
keymap("i", ".", ".<c-g>u")
keymap("i", ";", ";<c-g>u")

-- Better indent
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Paste over currently selected text without yanking it
keymap("v", "p", '"_dP')

-- Move Lines
keymap("n", "<A-j>", ":m .+1<CR>==")
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv")
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
keymap("n", "<A-k>", ":m .-2<CR>==")
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv")
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi")

-- Resize window using <shift> arrow keys
keymap("n", "<S-Up>", "<cmd>resize +2<CR>")
keymap("n", "<S-Down>", "<cmd>resize -2<CR>")
keymap("n", "<S-Left>", "<cmd>vertical resize -2<CR>")
keymap("n", "<S-Right>", "<cmd>vertical resize +2<CR>")

-- Insert blank line
keymap("n", "]<Space>", "o<Esc>", default_opts)
keymap("n", "[<Space>", "O<Esc>", default_opts)
