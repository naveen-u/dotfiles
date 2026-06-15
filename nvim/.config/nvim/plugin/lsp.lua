vim.pack.add({
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
})

require("mason").setup()

require("mason-tool-installer").setup({
	ensure_installed = {
		"lua_ls",
		"texlab",
		"clangd",
	},
})

require("mason-lspconfig").setup({
	automatic_enable = false,
})

---------------------- LSP Configs ----------------------

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
})

vim.lsp.config("texlab", {
	settings = {
		texlab = {
			build = { onSave = false },
		},
	},
})

vim.lsp.config("clangd", {
	cmd = {
		"clangd",
		"--background-index", -- index project in background, persist to disk
		"--clang-tidy", -- enable clang-tidy diagnostics
		"--all-scopes-completion", -- suggest symbols from all namespaces, not just visible ones
		"--completion-style=detailed", -- show full type info per overload instead of bundling
		"--header-insertion=iwyu", -- auto-insert #include for used symbols
		"--pch-storage=memory", -- keep precompiled headers in memory (faster, more RAM)
	},
})

vim.lsp.enable({
	"lua_ls",
	"texlab",
	"clangd",
})

-- Set up LSP keymaps when LSP attaches to a buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local bufnr = event.buf

		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, { buffer = bufnr, remap = false, desc = "Goto definition" })

		vim.keymap.set("n", "gD", function()
			vim.lsp.buf.declaration()
		end, { buffer = bufnr, remap = false, desc = "Goto declaration" })

		vim.keymap.set("n", "ge", function()
			vim.diagnostic.jump({ count = 1, float = true })
		end, { buffer = bufnr, remap = false, desc = "Goto next error" })

		vim.keymap.set("n", "gE", function()
			vim.diagnostic.jump({ count = -1, float = true })
		end, { buffer = bufnr, remap = false, desc = "Goto prev error" })

		vim.keymap.set("n", "grn", function()
			vim.lsp.buf.rename()
		end, { buffer = bufnr, remap = false, desc = "Rename symbol" })

		vim.keymap.set("n", "<leader>vd", function()
			vim.diagnostic.open_float()
		end, { buffer = bufnr, remap = false, desc = "View diagnostics" })

		vim.keymap.set("n", "<leader>vh", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end, { buffer = bufnr, remap = false, desc = "Toggle inlay hints" })

		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, { buffer = bufnr, remap = false, desc = "Hover" })
	end,
})
