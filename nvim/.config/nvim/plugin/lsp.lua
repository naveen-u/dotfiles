vim.pack.add({
	"https://github.com/mason-org/mason.nvim" ,
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
})

require("mason").setup()

require("mason-tool-installer").setup({
	ensure_installed = {
		"lua_ls",
		"stylua",
		"texlab",
		"clangd",
		"clang-format",
	},
})

require("mason-lspconfig").setup({
	automatic_enable = false,
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
})

vim.lsp.enable({
	"lua_ls",
	"stylua",
	"texlab",
	"clangd",
})
