vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-telescope/telescope-ui-select.nvim",
	"https://github.com/AckslD/nvim-neoclip.lua",
})

require("telescope").setup({
	defaults = {
		file_ignore_patterns = {
			"^.git/",
		},
	},
	pickers = {
		find_files = {
			hidden = true,
		},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
})
require("neoclip").setup()

require("telescope").load_extension("ui-select")
require("telescope").load_extension("neoclip")

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Telescope find git files" })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>fs", builtin.current_buffer_fuzzy_find, { desc = "Telescope file fuzzy finder" })
vim.keymap.set("n", "<leader>fq", builtin.quickfix, { desc = "Telescope quickfix" })
vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "Telescope LPS references" })
vim.keymap.set("n", "<leader>sc", builtin.colorscheme, { desc = "Telescope Switch colorscheme" })
vim.keymap.set("n", "<leader>fc", ":Telescope neoclip<CR>", { desc = "Telescope clipboard" })
