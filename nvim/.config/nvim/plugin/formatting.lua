vim.pack.add({
	"https://github.com/stevearc/conform.nvim",
})

require("conform").setup({
	-- Set specific formatters per language
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black", "isort" },
		markdown = { "prettier" },
		tex = { "texfmt" },
		cpp = { "clang-format" },
		-- Trim whitespace if no other formatters configured,
		-- and no LSP formatters found
		["_"] = { "trim_whitespace", lsp_format = "prefer" },
	},
	-- Use LSP formatting if no specific formatters configured
	default_format_opts = {
		lsp_format = "fallback",
	},
})

-- Auto-format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf, lsp_fallback = true })
	end,
})

vim.keymap.set("n", "<leader>cf", require("conform").format, { desc = "Code format" })
