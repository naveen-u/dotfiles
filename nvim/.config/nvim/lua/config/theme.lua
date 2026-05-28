vim.pack.add({
	"https://github.com/catppuccin/nvim",
})

require("catppuccin").setup({
	flavor = "mocha",
	transparent_background = true,
	integrations = {
		lualine = {},
		blink_cmp = {
			style = "bordered",
		},
		telescope = {
			enabled = true,
		},
		which_key = true,
	},
})

vim.cmd.colorscheme("catppuccin-mocha")
