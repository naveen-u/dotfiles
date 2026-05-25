vim.pack.add({
	"https://github.com/saghen/blink.lib",
	{
		src = "https://github.com/saghen/blink.cmp",
		build = "cargo build --release",
	},
	"https://github.com/windwp/nvim-autopairs",
})

-- Setup blink.cmp
local cmp = require('blink.cmp')
cmp.build():wait(60000)
cmp.setup({
	-- Keymap preset: 'default', 'super-tab', or 'enter'
	keymap = {
		preset = "super-tab",
		-- Optional overrides:
		-- ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
		-- ["<C-e>"] = { "hide" },
		["<CR>"] = { "accept", "fallback" },
		-- ["<Tab>"] = { "snippet_forward", "fallback" },
		-- ["<S-Tab>"] = { "snippet_backward", "fallback" },
		-- ["<C-k>"] = { "scroll_documentation_up", "fallback" },
		-- ["<C-j>"] = { "scroll_documentation_down", "fallback" },
	},

	appearance = {
		-- 'mono' | 'normal' — use 'mono' for Nerd Font icons
		nerd_font_variant = "mono",
	},

	completion = {
        menu = {
            border = "rounded",
        },
		-- Show documentation popup automatically
		documentation = {
            window = {
                border = "rounded",
            },
			auto_show = true,
			auto_show_delay_ms = 200,
		},
		-- Ghost text (inline preview)
		ghost_text = {
			enabled = true,
		},
	},

	-- Sources to pull completions from
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
		-- Optional: per-filetype overrides
		-- per_filetype = {
		--   lua = { "lsp", "path" },
		-- },
	},

	-- Built-in snippet support (uses vim.snippet)
	snippets = {
		preset = "default",
	},

	-- Fuzzy matching options
	fuzzy = {
		implementation = "prefer_rust_with_warning",
	},
})

-- nvim-autopairs config
require("nvim-autopairs").setup({
	check_ts = true, -- use treesitter to avoid pairing in strings/comments
})
