local opts = { noremap = true, silent = true }
local term_opts = {silent = true}

-- shorten the function name down
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   noraml_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v"
--   visual_block_mode = "x",
--   term_mode = "t",
--   vommand_mode = "c"

-- Normal
-- Window Navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>e", ":Lex 38<cr>", opts)

-- resize windows with arrows
keymap("n", "<C-Up>",   ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>",":vertical resize +2<CR>", opts)

-- navigate buffers
keymap("n", "<S-l>", "bnext<CR>", opts)
keymap("n", "<S-h>", "bpreviious<CR>", opts)

-- Insert
-- allows to escape out of insert quickly
keymap("i", "jk", "<ESC>", opts)

-- Visual
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)


-- Telescope
keymap("n", "<leader>f", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<CR>", opts)
-- Telescope + LSP
keymap("n", "<leader>d", "<cmd>Telescope lsp_definitions<CR>", opts)
keymap("n", "<leader>r", "<cmd>Telescope lsp_references<CR>", opts)
keymap("n", "<leader>i", "<cmd>Telescope lsp_implementation<CR>", opts)


-- LSP
keymap("n", "<a-f>", "<cmd>lua vim.lsp.buf.format()<CR>", opts)


-- BufferLine
keymap("n", "<c-n>", "<cmd>BufferLineCycleNext<CR>", opts)
keymap("n", "<c-p>", "<cmd>BufferLineCyclePrev<CR>", opts)
keymap("n", "<c-q>", "<cmd><CR>", opts)

-- nvimtree
keymap("n", "<F2>", ":NvimTreeToggle<CR>", opts)

-- TmuxNavigate
