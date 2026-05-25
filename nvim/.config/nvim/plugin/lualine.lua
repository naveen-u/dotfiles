vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-lualine/lualine.nvim",
})

local lsp_progress = vim.ui.progress_status()

require("lualine").setup({
	options = {
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { { "mode", separator = { left = "", right = "" }, right_padding = 2 } },
		lualine_b = { { "filename", path = 1 }, "branch" },
		lualine_c = {
			"%=", --[[ add your center components here in place of this comment ]]
		},
		lualine_x = { lsp_progress },
		lualine_y = { "filetype", "progress" },
		lualine_z = {
			{ "location", separator = { left = "", right = "" }, left_padding = 2 },
		},
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	},
	tabline = {},
	extensions = {},
})
