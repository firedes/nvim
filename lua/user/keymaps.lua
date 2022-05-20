local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
-- Navigate buffers
keymap("n", "<A-l>", ":bnext<CR>", opts)
keymap("n", "<A-h>", ":bprevious<CR>", opts)
-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==", opts)
-- New blank line up and down
keymap("n", "<C-j>", "<Esc>:set paste<CR>o<Esc>:set nopaste<CR>", opts)
keymap("n", "<C-k>", "<Esc>:set paste<CR>O<Esc>:set nopaste<CR>", opts)
keymap("n", "<CR>", "<Esc>i<CR><Esc>", opts)

-- Insert --
-- Navigate buffers
keymap("i", "<A-l>", "<cmd>bnext<CR><Esc>", opts)
keymap("i", "<A-h>", "<cmd>bprevious<CR><Esc>", opts)
-- Move text up and down
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
-- New blank line up and down
keymap("i", "<C-j>", "<Esc>o", opts)
keymap("i", "<C-k>", "<Esc>O", opts)
-- Words navigation
keymap("i", "<C-e>", "<C-o>e<C-o>l", opts)
keymap("i", "<C-b>", "<C-o>b", opts)
-- Go to the ending
keymap("i", "<C-l>", "<Esc>A", opts)
-- Delete character after cursor
keymap("i", "<C-f>", "<Del>", opts)
-- Delete all characters after cursor
keymap("i", "<C-c>", "<Esc>lC", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Command --
-- Navigate tab completion with <c-j> and <c-k>
keymap("c", "<C-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true })
keymap("c", "<C-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true })
