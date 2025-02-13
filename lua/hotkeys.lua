local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- toggle project tree
map("n", "<C-b>", ":NvimTreeToggle<CR>", opts)

-- open new terminal in vsplit
map("n", "<C-n>", ":vsp | terminal<CR>i", opts)
-- exit terminal
map("t", "<C-n>", "<C-\\><C-n>:q<CR>", opts)
map("t", "<ESC>", "<C-\\><C-n>", opts)

-- fuzzy search for files
map("n", "ff", ":Telescope find_files<CR>", opts)
map("n", "fg", ":Telescope live_grep<CR>", opts)
map("n", "fs", ":Telescope grep_string<CR>", opts)

-- resize window
map("n", "<C-S-Up>", ":resize -1<CR>", opts)
map("n", "<C-S-Down>", ":resize +1<CR>", opts)
map("n", "<C-S-Left>", ":vertical resize -1<CR>", opts)
map("n", "<C-S-Right>", ":vertical resize +1<CR>", opts)

-- move cursor to window
map("n", "<A-Up>", "<C-w>k", opts)
map("n", "<A-Down>", "<C-w>j", opts)
map("n", "<A-Left>", "<C-w>h", opts)
map("n", "<A-Right>", "<C-w>l", opts)

-- start highlight
map("n", "<S-Left>", "v<Left>", opts)
map("n", "<S-Right>", "v<Right>", opts)
map("n", "<S-Up>", "v<Up>", opts)
map("n", "<S-Down>", "v<Down>", opts)
map("n", "<S-End>", "v<End>", opts)

-- start highlight
map("i", "<S-Left>", "<Esc><Left>", opts)
map("i", "<S-Right>", "<Esc><Right>", opts)
map("i", "<S-Up>", "<Esc><Up>", opts)
map("i", "<S-Down>", "<Esc><Down>", opts)
map("i", "<S-End>", "<Esc><End>", opts)

-- continue highlight
map("x", "<S-Left>", "<Left>", opts)
map("x", "<S-Right>", "<Right>", opts)
map("x", "<S-Up>", "<Up>", opts)
map("x", "<S-Down>", "<Down>", opts)

-- break highlight
map("x", "<Left>", "<Esc><Left>", opts)
map("x", "<Right>", "<Esc><Right>", opts)
map("x", "<Up>", "<Esc><Up>", opts)
map("x", "<Down>", "<Esc><Down>", opts)

map("x", "<C-c>", "y", opts)
map("x", "<C-x>", "d", opts)
map("x", "<C-x>", "d", opts)

map("n", "<C-S-c>", "yy", opts)
map("n", "<C-S-v>", "P", opts)
map("n", "<C-S-z>", "u", opts)
map("i", "<C-S-v>", "<Esc>P", opts)
map("i", "<C-S-z>", "<Esc>u", opts)

map("n", "<C-A-Up>", "guaw", opts)
map("n", "<C-A-Down>", "gUaw", opts)

-- format
map("n", "<C-f>", ":Format<CR>", opts)


