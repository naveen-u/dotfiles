vim.pack.add({
    "https://github.com/stevearc/oil.nvim"
})

require("oil").setup({
    view_options = {
        show_hidden = true,
    },
})

-- Keymap to open Oil
vim.keymap.set("n", "<leader>e", vim.cmd.Oil, { desc = "Explore" })
