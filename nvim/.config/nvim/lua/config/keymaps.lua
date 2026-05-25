-- Use space as leader key
vim.g.mapleader = " "

-- Open explorer
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

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

-- Yank into system clipboard
vim.keymap.set({ "n", "v" }, "<C-c>", [["+y]])

-- Paste from system clipboard
vim.keymap.set({ "n", "v" }, "<C-S-v>", [["+p]])
vim.keymap.set("i", "<C-v>", '<ESC>"+pa')
