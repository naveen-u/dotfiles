vim.pack.add({
	"https://github.com/folke/snacks.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
})

require("snacks").setup({
	indent = { enabled = true },
	notifier = { enabled = true },
	picker = {
		win = {
			input = {
				keys = {
					["<Esc>"] = { "close", mode = { "n", "i" } },
				},
			},
		},
		sources = {
			files = {
				hidden = true,
				exclude = {
					"**/.git/*",
				},
			},
			grep = {
				hidden = true,
				exclude = {
					"**/.git/*",
				},
			},
		},
	},
})

local keymaps = {
	-- Top Pickers & Explorer
	{
		"<leader><space>",
		function()
			Snacks.picker.smart()
		end,
		desc = "Smart Find Files",
	},
	{
		"<leader>p,",
		function()
			Snacks.picker.buffers()
		end,
		desc = "Buffers",
	},
	{
		"<leader>p/",
		function()
			Snacks.picker.grep()
		end,
		desc = "Grep",
	},
	{
		"<leader>p:",
		function()
			Snacks.picker.command_history()
		end,
		desc = "Command History",
	},
	{
		"<leader>pn",
		function()
			Snacks.picker.notifications()
		end,
		desc = "Notification History",
	},
	{
		"<leader>pe",
		function()
			Snacks.explorer()
		end,
		desc = "File Explorer",
	},
}

for _, map in ipairs(keymaps) do
	local opts = { desc = map.desc }
	if map.silent ~= nil then
		opts.silent = map.silent
	end
	if map.noremap ~= nil then
		opts.noremap = map.noremap
	else
		opts.noremap = true
	end
	if map.expr ~= nil then
		opts.expr = map.expr
	end

	local mode = map.mode or "n"
	vim.keymap.set(mode, map[1], map[2], opts)
end
