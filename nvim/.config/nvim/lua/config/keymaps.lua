-- Use space as leader key
vim.g.mapleader = " "

-- CTRL+s to save in normal or input mode
vim.keymap.set({ "n", "i" }, "<C-s>", "<cmd>w<CR>", { desc = "Save buffer" })

-- Buffers
vim.keymap.set("n", "<leader>bc", "<cmd>bdelete<CR>", { desc = "Buffer close" })
vim.keymap.set("n", "<Leader>bh", "<cmd>bprevious<CR>", { desc = "Buffer previous" })
vim.keymap.set("n", "<Leader>bl", "<cmd>bnext<CR>", { desc = "Buffer next" })

-- Tabs
vim.keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Tab close" })
vim.keymap.set("n", "<leader>th", "<cmd>tabprevious<CR>", { desc = "Tab previous" })
vim.keymap.set("n", "<leader>tl", "<cmd>tabnext<CR>", { desc = "Tab next" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Tab new" })
vim.keymap.set("n", "<leader>to", "<cmd>tabonly<CR>", { desc = "Tab only" })

-- Panes
vim.keymap.set("n", "<leader>wv", "<cmd>vsplit<CR>", { desc = "Vertical split" })
vim.keymap.set("n", "<leader>wh", "<cmd>split<CR>", { desc = "Horizontal split" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Switch to left pane" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Switch to bottom pane" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Switch to top pane" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Switch to right pane" })
vim.keymap.set("n", "<C-A-h>", "<cmd>vertical resize -5<CR>", { desc = "Resize pane left (shrink)" })
vim.keymap.set("n", "<C-A-l>", "<cmd>vertical resize +5<CR>", { desc = "Resize pane right (grow)" })
vim.keymap.set("n", "<C-A-j>", "<cmd>horizontal resize -5<CR>", { desc = "Resize pane down (shrink)" })
vim.keymap.set("n", "<C-A-k>", "<cmd>horizontal resize +5<CR>", { desc = "Resize pane up (grow)" })

-- Yank into system clipboard
vim.keymap.set({ "n", "v" }, "<C-c>", [["+y]])

-- Paste from system clipboard
vim.keymap.set({ "n", "v" }, "<C-S-v>", [["+p]])
vim.keymap.set("i", "<C-v>", '<ESC>"+pa')
